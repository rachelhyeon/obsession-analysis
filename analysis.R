# Load in libraries
library(readtext)
library(quanteda)
library(quanteda.textstats)
library(quanteda.textplots)
library(cmu.textstat)
library(tidyverse)
library(knitr)
library(janitor)
library(ggraph)
library(syuzhet)
library(kableExtra)

## A. Text processing

### A.1 Readtext
# Use readtext function from readtext package to read in text files
rt_carol <- readtext("./carol/*.txt",
                     docvarsfrom = "filenames",
                     dvsep = "-",
                     docvarnames = c("title", "type", "subcorpus"))

rt_other <- readtext("./other/*.txt",
                     docvarsfrom = "filenames",
                     dvsep = "-",
                     docvarnames = c("title", "type", "subcorpus"))

rt_all <- rbind(rt_carol, rt_other)

# Strangers on a Train
rt_strangers <- readtext("./other/Strangers on a Train-novel-other.txt",
                         docvarsfrom = "filenames",
                         dvsep = "-",
                         docvarnames = c("title", "type", "subcorpus"))

# Ripley series
rt_ripley <- readtext("./other_sorted/Ripley/*.txt",
                      docvarsfrom = "filenames",
                      dvsep = "-",
                      docvarnames = c("title", "type", "subcorpus"))

# All short stories
rt_short <- rt_all %>%
  filter(type == "short")

### A.2 Create corpus object
carol_corpus <- corpus(rt_carol)
other_corpus <- corpus(rt_other)
strangers_corpus <- corpus(rt_strangers)
ripley_corpus <- corpus(rt_ripley)
all_corpus <- corpus(rt_all)
short_corpus <- corpus(rt_short)

### A.3 Tokenize

# Tokenize Carol
carol_tokens <- tokens(carol_corpus, include_docvars=TRUE, remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE, what = "word")
carol_tokens <- tokens_tolower(carol_tokens)

# Tokenize other books
other_tokens <- tokens(other_corpus, include_docvars=TRUE, remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE, what = "word")
other_tokens <- tokens_tolower(other_tokens)

# Tokenize all books
all_tokens <- tokens(all_corpus, include_docvars=TRUE, remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE, what = "word")
all_tokens <- tokens_tolower(all_tokens)

# Tokenize Strangers on a Train and Ripley Series
strangers_tokens <- tokens(strangers_corpus, include_docvars=TRUE, remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE, what = "word")
strangers_tokens <- tokens_tolower(strangers_tokens)

ripley_tokens <- tokens(ripley_corpus, include_docvars=TRUE, remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE, what = "word")
ripley_tokens <- tokens_tolower(ripley_tokens)

# Tokenize short stories
short_tokens <- tokens(short_corpus, include_docvars=TRUE, remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE, what = "word")
short_tokens <- tokens_tolower(short_tokens)

## B. Descriptive statistics

### B.1 Dispersion

# Dispersion for all text
all_dfm <- dfm(all_tokens)
prop_all_dfm <- dfm_weight(all_dfm, scheme = "prop")

dispersion_all <- dispersions_all(all_dfm)
dispersion_all_rounded <- dispersion_all %>% 
  mutate_if(is.numeric, round, digits=3)

# Dispersion for Carol subcorpus
carol_dfm <- dfm(carol_tokens)
prop_carol_dfm <- dfm_weight(carol_dfm, scheme = "prop")

dispersion_carol <- dispersions_all(carol_dfm)

# Dispersion for Other subcorpus
other_dfm <- dfm(other_tokens)
prop_other_dfm <- dfm_weight(other_dfm, scheme = "prop")

dispersion_other <-dispersions_all(other_dfm)

kable(head(dispersion_all_rounded, 15), booktabs = TRUE)

disp_4words <- dispersion_all_rounded %>%
  filter(Token %in% c("thought", "think", "want", "love"))

kable(disp_4words, booktabs = TRUE)

### B.2 Frequency of words

freq_carol <- textstat_frequency(carol_dfm) %>%
  data.frame(stringsAsFactors = F) %>%
  dplyr::select(feature, frequency) %>%
  rename("Token" = "feature", "Frequency" = "frequency")

freq_other <- textstat_frequency(other_dfm) %>%
  data.frame(stringsAsFactors = F) %>%
  dplyr::select(feature, frequency) %>%
  rename("Token" = "feature", "Frequency" = "frequency")

### B.3 Keyness between Carol (target) and Other (reference) subcorpora

carol_kw <- textstat_keyness(all_dfm, docvars(all_dfm, "subcorpus") == "carol",
                             measure = "lr")

textplot_keyness(carol_kw) + scale_colour_discrete(name = "Subcorpora", labels = c("Carol", "Other"))

# Keyness without effect size
head(carol_kw)
tail(carol_kw)

# Keyness with effect size
carol_kw_2 <- keyness_table(carol_dfm, other_dfm)
other_kw_2 <- keyness_table(other_dfm, carol_dfm)

kableExtra::kbl(head(carol_kw_2, 20), caption = "Tokens with the highest keyness values in Carol subcorpus when compared to Other subcorpus", booktabs = T, linesep = "", digits = 2) %>%
  kableExtra::kable_styling(latex_options = "HOLD_position") %>%
  kableExtra::kable_classic()

kableExtra::kbl(head(other_kw_2, 20), caption = "Tokens with the highest keyness values in Other subcorpus when compared to Carol subcorpus", booktabs = T, linesep = "", digits = 2) %>%
  kableExtra::kable_styling(latex_options = "HOLD_position") %>%
  kableExtra::kable_classic()

## C. Lexicon analysis

### C.1 Observed proportion of obsessive words

# Load dictionary/lexicon for obsession
ps_dict <- dictionary(file = "obsession_dict.yml")

obs_carol <- carol_tokens %>%
  tokens_lookup(dictionary = ps_dict, levels = 1) %>%
  dfm() %>%
  convert(to = "data.frame") %>% 
  mutate(
    tokens_total = ntoken(carol_tokens),
    obs_norm = (obsession/tokens_total)*100
  )

obs_other <- other_tokens %>%
  tokens_lookup(dictionary = ps_dict, levels = 1) %>%
  dfm() %>%
  convert(to = "data.frame") %>% 
  mutate(
    tokens_total = ntoken(other_tokens),
    obs_norm = (obsession/tokens_total)*100
  )

obs_total <- rbind(obs_carol, obs_other)

# Mutate table
obs_total_2 <- obs_total %>%
  arrange(desc(obs_norm)) %>%
  rename("Texts" = doc_id,
         "Obsession Count" = obsession,
         "Total tokens" = tokens_total,
         "Observed Proportion" = obs_norm) %>%
  mutate_at(4, round, 2)

kable(obs_total_2, caption = "Obsession token count, total tokens, and observed proportion for every text",
      booktabs = TRUE)

obs_other_w_totals <- obs_other %>%
  add_row(doc_id="Total", obsession=sum(obs_other$obsession), tokens_total=sum(obs_other$tokens_total), 
          obs_norm=mean(obs_other$obs_norm))

# Just get the total count
obs_other_total <- obs_other_w_totals %>%
  slice(116)

other_tokens_total <- as.numeric(obs_other_total$tokens_total[[1]])
other_ntext <- nrow(obs_other)

carol_tokens_total <- as.numeric(obs_carol$tokens_total[[1]])
carol_ntext <- 1

subcorp <- c("Carol", "Other")
ntext <- c(carol_ntext, other_ntext)
tokens_tot <- c(carol_tokens_total, other_tokens_total)

corpus_comp <- data.frame("Subcorpus" = subcorp,
                          "Texts" = ntext,
                          "Tokens" = tokens_tot)

# Corpus composition table
corpus_comp <- corpus_comp %>%
  janitor::adorn_totals()

kable(corpus_comp, caption = "Corpus Composition of Carol and Other subcorpora")

p <- ggplot(obs_total,aes(x = obs_norm)) + 
  geom_histogram(bins = 20, alpha=.5, position = "identity", fill="pink") +
  theme_classic() +
  theme(axis.text = element_text(size=10)) +
  geom_vline(aes(xintercept = mean(obs_other$obs_norm), color="Other"), linetype="dashed") +
  geom_vline(aes(xintercept = obs_carol$obs_norm, color="Carol"), linetype="longdash") +
  scale_color_discrete(name = "Mean") +
  labs(x = "Observed Proportion",
       y = "Count")

### C.2 Log-likelihood test and log-ratio

# Log-likelihood calculation
#
# Log-likelihood tests the frequencies of tokens in one corpus vs. another.
# It is often used instead of a chi-square test, as it has been shown to be
# more resistant to corpora of varying sizes. For more detail see: http://ucrel.lancs.ac.uk/llwizard.html
#
# @param n_target The raw (non-normalized) token count in the target corpus
# @param n_reference The raw (non-normalized) token count in the reference corpus
# @param total_target The total number of tokens in the target corpus
# @param total_reference The total number of tokens in the reference corpus
# @return A numeric value representing log-likelihood
# @export
log_like <- function(n_target, n_reference, total_target, total_reference, correct=FALSE) {
  expected_a <- (n_target + n_reference)*(total_target/(total_target + total_reference))
  expected_b <- (n_target + n_reference)*(total_reference/(total_target + total_reference))
  if(correct==T){ #Perform the "Yates" correction
    n_a <- ifelse(n_target - expected_a > 0.25, n_target - 0.5, n_target)
    n_b <- ifelse(n_target - expected_a > 0.25,  n_reference + 0.5, n_reference)
    
    n_a <- ifelse(expected_a - n_target > 0.25, n_target + 0.5, n_a)
    n_b <- ifelse(expected_a - n_target > 0.25, n_reference - 0.5, n_b)
  }
  else{
    n_a <- n_target
    n_b <- n_reference
  }
  L1 <- ifelse(n_a == 0, 0, n_a*log(n_a/expected_a))
  L2 <- ifelse(n_b == 0, 0, n_b*log(n_b/expected_b))
  likelihood <- 2*(L1 + L2)
  likelihood <- ifelse(n_target/total_target > n_reference/total_reference, likelihood, -likelihood)
  return(likelihood)
}

# Log-ratio calculation
#
# Take a target column and a reference column, and return an effect size
# This effect size calculation is called Log Ratio
# And was proposed by Andrew Hardie: http://cass.lancs.ac.uk/log-ratio-an-informal-introduction/
#
# @param n_target The raw (non-normalized) token count in the target corpus
# @param n_reference The raw (non-normalized) token count in the reference corpus
# @param total_target The total number of tokens in the target corpus
# @param total_reference The total number of tokens in the reference corpus
# @return A numeric value representing the log ratio
# @export
log_ratio <- function (n_target, n_reference, total_target, total_reference) {
  total_a <- sum(n_target)
  total_b <- sum(n_reference)
  percent_a <- ifelse(n_target == 0, 0.5 / total_a, n_target/total_target)
  percent_b <- ifelse(n_reference == 0, 0.5 / total_b, n_reference/total_reference)
  ratio <- log2(percent_a / percent_b)
  return(ratio)
}

log_like(obs_carol$obsession, sum(obs_other$obsession), obs_carol$tokens_total, sum(obs_other$tokens_total))

log_ratio(obs_carol$obsession, sum(obs_other$obsession), obs_carol$tokens_total, sum(obs_other$tokens_total))

## D. KWIC

# KWIC on carol
carol_kwic <- kwic(carol_tokens, ps_dict)

# Extract out obsessive words to get found
carol_obs_keywords <- carol_kwic$keyword

# Calculate frequency of obsessive words
carol_obs_dfm <- dfm(tokens(carol_obs_keywords))
carol_obs_frequency <- textstat_frequency(carol_obs_dfm) %>%
  select(c(feature, frequency)) %>%
  rename(Feature = feature, Frequency = frequency)

kable(head(carol_obs_frequency, 15))

carol_4words_kwic <- kwic(carol_tokens, pattern=c("thought", "think", "want", "love"), window = 5)

dfm_list <- list()
for (key in names(ps_dict)) {
  this_dfm <- tokens_select(other_tokens, ps_dict[key], pad = TRUE) %>%
    tokens_compound(ps_dict[key]) %>%
    tokens_replace("", "OTHER") %>%
    dfm(tolower = FALSE)
  dfm_list <- c(dfm_list, this_dfm)
}
names(dfm_list) <- names(ps_dict)

feature_sum <- colSums(dfm_list$Obsession)

other_obs_frequency <- as.data.frame(feature_sum) %>%
  slice(-c(1)) %>%
  arrange(desc(feature_sum)) %>%
  rownames_to_column("Feature") %>%
  rename(Frequency = feature_sum)

kable(head(other_obs_frequency, 15))

ripley_4words_kwic <- kwic(ripley_tokens, pattern = c("want"), window = 5)

## E. Collocation analysis

### E.1 Collocation of thought

carol_collocates_thought <- collocates_by_MI(carol_tokens, "thought") %>% filter(col_freq >= 4 & MI_1 >= 4)
other_collocates_thought <- collocates_by_MI(other_tokens, "thought") %>% filter(col_freq >= 50 & MI_1 >= 4)

# Now, we create a graph for thought
net <- col_network(carol_collocates_thought, other_collocates_thought)
ggraph(net, layout = "stress") +
  geom_edge_link(color = "grey80", alpha = 0.75) +
  geom_node_point(aes(alpha = node_weight, size = 3, color = n_intersects)) +
  geom_node_text(aes(label = label), repel = T, size = 3) +
  scale_alpha(range = c(0.2, 0.9)) +
  theme_graph(base_family = "Helvetica") +
  theme(legend.position = "none")

### E.2 Collocation of think

carol_collocates_think <- collocates_by_MI(carol_tokens, "think") %>% filter(col_freq >= 4 & MI_1 >= 4)
other_collocates_think <- collocates_by_MI(other_tokens, "think") %>% filter(col_freq >= 50 & MI_1 >= 4)

# Now, we create a graph for think
net <- col_network(carol_collocates_think, other_collocates_think)
ggraph(net, layout = "stress") +
  geom_edge_link(color = "grey80", alpha = 0.75) +
  geom_node_point(aes(alpha = node_weight, size = 3, color = n_intersects)) +
  geom_node_text(aes(label = label), repel = T, size = 3) +
  scale_alpha(range = c(0.2, 0.9)) +
  theme_graph(base_family = "Helvetica") +
  theme(legend.position = "none")

### E.3 Collocation of want

carol_collocates_want <- collocates_by_MI(carol_tokens, "want") %>% filter(col_freq >= 4 & MI_1 >= 4)
other_collocates_want <- collocates_by_MI(other_tokens, "want") %>% filter(col_freq >= 30 & MI_1 >= 4)

# Now, we create a graph for want
net <- col_network(carol_collocates_want, other_collocates_want)
ggraph(net, layout = "stress") +
  geom_edge_link(color = "grey80", alpha = 0.75) +
  geom_node_point(aes(alpha = node_weight, size = 3, color = n_intersects)) +
  geom_node_text(aes(label = label), repel = T, size = 3) +
  scale_alpha(range = c(0.2, 0.9)) +
  theme_graph(base_family = "Helvetica") +
  theme(legend.position = "none")

### E.4 Collocation of love

carol_collocates_love <- collocates_by_MI(carol_tokens, "love") %>% filter(col_freq >= 4 & MI_1 >= 4)
other_collocates_love <- collocates_by_MI(other_tokens, "love") %>% filter(col_freq >= 10 & MI_1 >= 4)

# Now, we create a graph for love
net <- col_network(carol_collocates_love, other_collocates_love)
ggraph(net, layout = "stress") +
  geom_edge_link(color = "grey80", alpha = 0.75) +
  geom_node_point(aes(alpha = node_weight, size = 3, color = n_intersects)) +
  geom_node_text(aes(label = label), repel = T, size = 3) +
  scale_alpha(range = c(0.2, 0.9)) +
  theme_graph(base_family = "Helvetica") +
  theme(legend.position = "none")

## F. Sentiment Analysis using NRC dictionary

carol_v <- get_sentences(rt_carol$text)
carol_nrc <- get_nrc_sentiment(carol_v)

barplot(
  sort(colSums(prop.table(carol_nrc[, 1:8]))), 
  horiz = TRUE, 
  cex.names = 0.7,
  las = 1, 
  main = "Emotions in Carol", xlab="Percentage"
)

ripley_v <- get_sentences(rt_ripley$text)
ripley_nrc <- get_nrc_sentiment(ripley_v)

barplot(
  sort(colSums(prop.table(ripley_nrc[, 1:8]))), 
  horiz = TRUE, 
  cex.names = 0.7,
  las = 1, 
  main = "Emotions in Ripley Series", xlab="Percentage"
)

# Extract out column names for emotions and sentiments
emotions <- colnames(carol_nrc[1:8])
sentiments <- colnames(carol_nrc[9:10])

emotions_carol <- colSums(prop.table(carol_nrc[ , 1:8]))
sentiments_carol <- colSums(prop.table(carol_nrc[ , 9:10]))

emotions_ripley <- colSums(prop.table(ripley_nrc[, 1:8]))
sentiments_ripley <- colSums(prop.table(ripley_nrc[ , 9:10]))

emotions_table <- cbind(emotions_carol, emotions_ripley)
sentiments_table <- cbind(sentiments_carol, sentiments_ripley)

# Change table into long form for plotting
emotions_table <- emotions_table %>%
  as.data.frame() %>%
  tibble::rownames_to_column("Emotions") %>%
  pivot_longer(c("emotions_carol", "emotions_ripley"), values_to = "Percentage")

# Plot grouped bar chart
emotions_table %>%
  ggplot(aes(x = Emotions, y = Percentage, fill = name)) +
  geom_bar(stat="identity", position = "dodge") +
  coord_flip()
