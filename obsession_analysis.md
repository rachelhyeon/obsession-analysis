Obsession in the Works of Patricia Highsmith
================
Myung Kyung (Rachel) Hyeon

2022-12-12

# Abstract

In this paper, we analyzed the works of Patricia Highsmith, an
American novelist widely known for her psychological thrillers. 
*Carol*, her second published novel, strikes out as an outlier in her
works as the only novel that centers on the theme of love. This paper
examined whether obsession is a common theme in both *Carol* and her
remaining works. Keyness analysis, lexicon analysis using a custom
dictionary of words related to obsession, and Key Word In Context
analysis were conducted. Keyness analysis revealed differences in
character names and gender pronouns used in *Carol* and her remaining
works. Female gender pronouns were used more frequently in *Carol*,
and male gender pronouns were used more frequently in her other works.
Lexicon analysis revealed a statistically significant difference
between the means of the observed proportion of words related to
obsession in *Carol* and her other works. The observed proportion of
obsessive words was higher for *Carol* than the mean observed
proportion of her other works. Key Word In Context analysis revealed
that the words tagged as obsessive seemed to vary in their degree of
obsession depending on the context in which the words were used.
Overall, obsession seemed to be a common theme in all of Patricia
Highsmith's works, although further validation of the custom
dictionary of obsessive words would be necessary.

# Introduction

Patricia Highsmith was an American novelist widely known for her
psychological thrillers. Her five-book series featuring Tom Ripley, an
amoral serial killer and a con artist, is one of her most famous
psychological thrillers. In the first book of the series, *The Talented
Mr. Ripley*, Highsmith explored the co-existence of contrasting themes
such as obsession and apathy, vulnerability and narcissism, and desire
and hatred that the main character Tom Ripley feels towards Dickie
Greenleaf. Highsmith's first novel, *Strangers on a Train*, also
explored similar themes of obsession, vulnerability, and hatred that
exist in two main characters, Guy Haines and Charles Anthony Bruno, as
they become entangled in a plan to murder for each other.

*Carol*, originally published as *The Price of Salt* under a pseudonym
Claire Morgan, strikes out as an outlier in her works. *Carol* is
Highsmith's only novel that centers on a theme of love and is drawn from
her personal experiences. The characters in *Carol* are given a more
explicit sexual existence and a happy ending which can be rarely seen in
her other novels [@guardian]. However, *Carol* shares similar themes of
obsession, vulnerability, and desire that seems to recur in Highsmith's
works. In *Carol*, the readers experience the story through the
protagonist, Therese Belivet, a young woman struggling to find her place
in society. As she falls in love with Carol Aird, a woman she met at a
department store, the confusion, desire, vulnerability, and obsession
Therese feels towards Carol is conveyed to the reader.

This paper will attempt to answer whether obsession is a common theme in
both *Carol* and her remaining works consisting mainly of psychological
thrillers. Keyness analysis between *Carol* and the remaining works will
be conducted to identify the differences between the two subcorpora.
Frequencies of tokens related to obsession in the two subcorpora, one
subcorpus consisting only of *Carol* and the other consisting of all her
remaining works, will be compared using a log-likelihood (LL) test to
report whether the differences between the two subcorpora are
statistically significant. Key Word In Context (KWIC) analysis will be
conducted to reveal how obsessive words are used in *Carol* and the
remaining works.

# Data

A corpus of all Patricia Highsmith's published works, except her joint
work with other writers and her posthumous diary publication, was
created. In total, 30 published works were included in the corpus, 22 of
which were novels, and 8 were published short story collections. The
short story collections were manually separated into individual short
stories except for one short story collection, *Little Tales of
Misogyny*. The reason why *Little Tales of Misogyny* was not broken up
into individual short stories was that the tales were extremely brief
consisting of only few pages of "female caricature", and they were all
centered on the theme of how men and women use each other "to the point
of abuse" [2]. Other collections consisted of short stories
with distinct plots and characters that warranted separation. In total,
92 individual short stories were separated from 7 short story
publications.

The corpus was divided into two subcorpora, the first subcorpus named
"Carol" containing the novel *Carol*, and the second subcorpus named
"Other" containing all other 29 publications. Table
[1] shows that there were approximately 27
times more tokens in the Other subcorpus than Carol subcorpus. In total,
there were 2,568,653 tokens in both subcorpora.


  | Subcorpus | Publications | Texts | Tokens |
  |:-----------------|:--------------:|:-------:|---------:|
  | Carol           |     1        |   1     |   90134 |
  | Other          |       29      |   115  |   2478519 |
  | Total           |        30      |   116  |   2568653 |                                

Corpus Composition of Carol and Other subcorpora

The data was gathered by converting EPUB files to text files using
Calibre, an e-book management software. The raw text files were manually
cleaned by removing the front matters and contents table. The text files
were tokenized using the `tokens` function from `quanteda` library in R.

The "Tokens" column in Table
[1] reflects the token count after data
cleaning. For Key Word In Context (KWIC) analysis, a separate subcorpus
consisting only of five books in the Ripley series (*The Talented Mr.
Ripley, Ripley Under Ground, Ripley's Game, The Boy Who Followed Ripley,
Ripley Under Water*) was constructed.

# Methods

## Keyness Analysis

A keyness analysis of Carol and Other subcorpora was conducted to
identify the differences in token frequencies. Keyness analysis reveals
what tokens, called "key words", appear more frequently than expected in
the target corpus compared to the reference corpus [3]. By
identifying the key words in each corpus, "socially important concepts"
unique to the target corpus can be represented [4]. Keyness
analysis was conducted in both directions, with Carol subcorpus being
the target corpus initially and the Other subcorpus being the reference
corpus. Then, the Other subcorpus became the target corpus, and the
Carol subcorpus became the reference corpus. For the tokens with the
highest keyness values, log-likelihood (LL), the effect size using log
ratio (LR), the p-value associated with the log-likelihood (PV), the
absolute frequency in the target corpus (AF_Tar), the absolute frequency
in the reference corpus (AF_Ref), the relative frequency in the target
corpus per 100,000 tokens (Per_10.x_Tar), the relative frequency in the
reference corpus per 100,000 tokens (Per_10.x_Ref), and deviation of
proportions in the target and reference corpus (DP_Tar and DP_Ref,
respectively), were calculated. The cut-off points for log-likelihood
ratio statistic are 3.84 for $p < 0.05$, and 15.13 for $p < 0.0001$.

## Lexicon-Based Analysis of Obsession

A lexicon-based analysis of obsession was conducted to quantify the
degree of obsession in each text. A lexicon-based analysis is commonly
used for sentiment analysis, where a dictionary containing words with
positive and negative sentiments is matched with the text being
analyzed. For this analysis, a custom lexicon/dictionary containing 432
words related to obsession was built (Appendix 7.1). NRC Emotion Lexicon
was used as a basis for building the lexicon [5]. In addition
to the NRC Emotion Lexicon, multi-word expressions (such as "train of
thought" and "could not stop") and other synonyms of obsession that did
not appear in the NRC Emotion Lexicon were added. The `tokens_lookup`
function from `quanteda` library was used to count the number of matches
between the dictionary and the text. Results of the log-likelihood test
and the effect size using log ratio were reported to test whether the
differences between the two subcorpora are statistically significant at
95\% confidence level. The cut-off points for a log-likelihood ratio
statistic are 3.84 for $p < 0.05$, and 15.13 for $p < 0.0001$. Effect
size using log ratio was also reported to see the magnitude of the given
difference.

## Key Word In Context (KWIC) Analysis

A Key Word In Context analysis was conducted to analyze the meaning and
usage of the four most frequently occurring obsessive words in *Carol*
and the Ripley series. The Ripley series was chosen as it is one of the
most well-known novels by Patricia Highsmith. Also, Patricia Highsmith
strongly identified with the main character Tom Ripley, sometimes
signing off her writing with "Pat H., alias Ripley" [6]. A KWIC
analysis can reveal various ways meaning can change for a word depending
on the context in which it is used [7]. Selected phrases with
five context words before and after the key words were presented. Each
phrase contained one of the four most frequently appearing obsessive
words, which were "thought", "think", "want", and "love". The same four
words appeared most frequently in both Carol and Other subcorpora out of
all obsessive words in the obsession dictionary.

# Results

## Keyness Analysis

Table [2] shows the result of the keyness
analysis with Carol subcorpus as the target corpus and Other subcorpus
as the reference corpus. Out of the six key words with the highest
keyness values, four were related to the names of the characters in the
book, and two were gender pronouns referring to a woman. The token with
the highest keyness/log-likelihood (LL) value was "Therese" (name of the
main character) with a statistically significant keyness value of
8889.52 ($LL > 15.13, p < 0.0001$) and the effect size (LR) of 11.10.
This means that the word "Therese" appeared about 2048 times more
frequently in *Carol* than the reference corpus. The next key word with
the highest keyness value was "Carol", which is also the name of the
main character, with a statistically significant keyness value over 8000
and effect size of 8.84. This suggests that the word "Carol" appeared
about 458 times more frequently in *Carol* than the Other subcorpus. Key
words with the third and fourth highest keyness values were "she" and
"her", respectively, with a keyness value over 1200 and a log ratio of
about 1.5. This suggests that Patricia Highsmith used "she" and "her"
about 2.8 times more frequently in *Carol* than her other published
works.

Table [3] shows the result of keyness analysis
with Other subcorpus as the target corpus and Carol subcorpus as the
reference corpus. Out of the six key words with the highest keyness
values, two were related to the names of the characters in different
publications, three were gender pronouns referring to a man, and one was
a noun ("police"). The gender pronouns referring to a man were the
first, second, and fourth key words with the highest keyness values of
1492.51, 925.60, 336.52, respectively. The key words "he" and "his" had
a log ratio of about 1.9, meaning they appeared about 4 times more
frequently in the Other subcorpora than in *Carol*. The absolute
frequency of "police" (LL = 145.45, LR = 7.21) is 0 in *Carol*, which
suggests that *Carol* has a weaker theme related to crime compared to
the rest of her works.


  | Token |  LL  |    LR |  PV  | AF_Tar  | AF_Ref  | Per_10.6_Tar  | Per_10.6_Ref  | DP_Tar  | DP_Ref |
  ---------| ---------| -------| ----| -------- | -------| -------------- |-------------- |--------| --------|
| therese  |   8889.52  | 11.10  |  0   |  1354 |      17    |   15022.08       |    6.86     |   0  |   0.96 |
|  carol     |  8128.83  |  8.84  |  0   |  1302   |    78      | 14445.16      |    31.47      |  0  |   0.93
|  she       |  2121.39  |  1.64  |  0   |  2461  |  21782    |   27303.79    |    8788.33    |    0  |   0.26  |
|  her        | 1618.23   | 1.52  |  0    | 2129  |  20458    |   23620.39    |    8254.14      |  0   |  0.23 |
|  abby     |   1279.64  | 13.36 |   0  |    191   |     0     |   2119.07       |    0.00    |    0    |   NA |
|  carol's   |  1176.19  |  8.76 |   0    |  189    |   12     |   2096.88       |    4.84     |   0   |  0.96 |

 Tokens with the highest keyness values in Carol subcorpus when
 compared to Other subcorpus

  | Token |  LL  |    LR |  PV  | AF_Tar  | AF_Ref  | Per_10.6_Tar  | Per_10.6_Ref  | DP_Tar  | DP_Ref |
 | --------| --------- |------| ---- |-------- |-------- |-------------- |--------------| -------- |--------|
|  he      |   1492.51 |  1.91 |   0  |  55315  |    537   |    22317.82   |     5957.80   |  0.14    |    0 |
|  his      |   925.60  | 1.94  |  0  |  33504   |   317    |   13517.78    |    3516.99   |  0.12    |    0   |
|  tom     |    736.14 |  7.60  |  0  |  10653   |     2     |   4298.14      |    22.19   |  0.80   |     0    |
|  him      |   336.52  | 1.46  |  0  |  17611  |    232   |     7105.47    |    2573.95  |   0.17   |     0  |
|  arthur   |   172.67 |  7.46  |  0   |  2417   |     0     |    975.18       |    0.00   |  0.95    |   NA |
|  police    |  145.45 |  7.21  |  0   |  2036    |    0     |    821.46       |    0.00   |  0.32    |   NA |

Tokens with the highest keyness values in Other subcorpus when
  compared to Carol subcorpus

## Lexicon-Based Analysis of Obsession

Table [4] shows the obsession token count, total
tokens, and observed proportion (calculated by dividing obsession token
count by total tokens) for every published novel and short story
collection in the corpus. The obsession count ranged from 572 to 2028.
The average obsession count for the Other subcorpora was 1036.552. The
obsession count for Carol was 1283. Observed proportion for the 30
publications ranged from 0.85 to 1.57. The observed proportion for Carol
was 1.42, which is at the higher end of the range. Figure
[1] shows a histogram of observed proportions for all 116 texts in the
corpus. Eight short story texts had an observed proportion greater than
1.57. One short story "Miss Juste And The Green Rompers" had an observed
proportion greater than 3. The observed proportion of words related to
obsession for Carol (1.4) was higher than the mean observed proportion
for the Other subcorpus (1.2).

The log-likelihood ratio statistic comparing Carol (target corpus) and
Other subcorpora (reference corpus) was 30.05, and the log ratio was
0.23. Since the log-likelihood ratio statistic is greater than 15.13
($p < 0.0001$), we can reject the null hypothesis assuming that there is
no difference in the observed proportion of words related to obsession
for Carol and Other subcorpora. The log ratio was 0.23, which means that
the observed proportion of obsession for Carol is about 1.17 times
greater than the observed proportion for the Other subcorpus.

![Distribution of observed proportion of tokens related to obsession for
116 texts and comparison of mean observed proportion of obsession
between Carol and Other subcorpora. Count represents the number of texts
with a certain value of observed proportion of
obsession.](./images/histogram-1.pdf)

| Texts                                       | Obsession Count | Total Tokens | Observed Proportion |
|---------------------------------------------|-----------------|--------------|---------------------|
| Animal-Lover's Book of Beastly Murder       | 572             | 66927        | 0.85                |
| Black House, The                            | 802             | 79831        | 1.00                |
| Blunderer, The                              | 1325            | 84261        | 1.57                |
| Boy Who Followed Ripley, The                | 1245            | 108751       | 1.14                |
| Cry of the Owl, The                         | 1193            | 88644        | 1.35                |
| Deep Water                                  | 1168            | 87863        | 1.33                |
| Dog's Ransom, A                             | 1035            | 84088        | 1.23                |
| Edith's Diary                               | 1358            | 104186       | 1.30                |
| Eleven                                      | 648             | 55678        | 1.16                |
| Found in the Street                         | 1230            | 99215        | 1.24                |
| Game for the Living, A                      | 1101            | 83671        | 1.32                |
| Glass Cell                                  | 951             | 79915        | 1.19                |
| Little Tales of Misogyny                    | 249             | 21641        | 1.15                |
| Mermaids on the Golf Course                 | 705             | 68673        | 1.03                |
| Nothing That Meets the Eye                  | 2028            | 160088       | 1.27                |
| People Who Knock on the Door                | 1192            | 106828       | 1.12                |
| Ripley Under Ground                         | 1105            | 91834        | 1.20                |
| Ripley Under Water                          | 1073            | 92627        | 1.16                |
| Ripley's Game                               | 1045            | 89615        | 1.17                |
| Slowly, Slowly in the Wind                  | 673             | 62389        | 1.08                |
| Small g                                     | 893             | 92761        | 0.96                |
| Strangers on a Train                        | 1381            | 90870        | 1.52                |
| Suspension of Mercy, A                      | 965             | 74556        | 1.29                |
| Talented Mr Ripley, The                     | 1104            | 93665        | 1.18                |
| Tales of Natural and Unnatural Catastrophes | 602             | 72514        | 0.83                |
| This Sweet Sickness                         | 1236            | 92840        | 1.33                |
| Those Who Walk Away                         | 1087            | 78483        | 1.39                |
| Tremor of Forgery, The                      | 1151            | 78318        | 1.47                |
| Two Faces of January, The                   | 943             | 87787        | 1.07                |
| Price of Salt, The (or Carol)               | 1283            | 90134        | 1.42                |


## KWIC Analysis of Carol and the Ripley Series

Table [5] shows the 15 most frequently appearing
tokens related to obsession in the Carol subcorpus. The top four tokens
were "thought", "think", "want", and "love". Table
[6] shows 15 most frequently appearing
tokens related to obsession in the Other subcorpus. The top four tokens
related to obsession in the Other subcorpus were also "thought",
"think", "want", and "love", in the same order of frequency as the Carol
subcorpus. Other words such as "happy", "wondered", "lost", "miss",
"loved", "pleasure", and "wished" appeared in both tables. However, the
word "murder" appeared 355 times in the Other subcorpus while it was not
one of the most commonly occurring words in *Carol*.

Table [7] shows the dispersion of "thought",
"think", "want" and "love" in all 116 texts. Looking at Juilland's D
measure in Table [7], all four tokens had values close to 1,
signifying that they are evenly dispersed throughout all text. All four
tokens had a deviation of proportions (DP) measure close to 0, which
also signified that they are evenly dispersed throughout the texts. Out
of the four tokens, "love" was the most unevenly distributed token with
the lowest Juilland's D value of 0.876 and the highest DP value of
0.260. "Thought" was the most evenly dispersed token with the highest
Juilland's D value of 0.958 and the lowest DP value of 0.098.

Tables [8] to [11] show examples of phrases that had strong
or weak obsessive emotions in Carol and Other subcorpora for the four
most frequent tokens related to obsession. In Table
[8], it can be seen that the four words
"thought", "think", "want", and "love" appeared in sentences that
display a strong obsessive emotion. The token "love" seemed to have an
especially strong association with obsession. However, Table
[9] shows that the four key words were also present in sentences with weak
obsession emotion in Carol. For instance, the words "thought" and
"think" appeared in sentences where the thought was casual, or in a
dialogue without much emotion. The word "love" also appear in sentences
with weak obsessive emotion, such as in a dialogue without much emotion.

Similarly, Table [10] shows examples of phrases with the four
key words associated with a strong obsessive emotion for the Ripley
series. The tokens "thought" and "think" had especially strong
associations with obsession in the Ripley series. Table
[11] shows that the four key words were also
present in sentences with a weak obsessive emotion in the Ripley series.
For instance, the words "thought" and "think" appeared in sentences
where the thought was casual, or in a dialogue without much emotion. The
words "want" and "love" also appeared in sentences with a weak obsessive
emotion, especially in a dialogue or as part of the formula to end a
letter ("With love").


| Feature   |   Frequency |
|--------------|----------|
| thought     |       280 |
| think          |    189 |
| want          |     170 |
| love         |       92 |
| of              |    45 |
| miss          |      41 |
| happy          |     34 |
| wondered    |        29 |
| loved          |     27 |
| lost          |      20 |
| wish         |       19 |
| wished      |        17 |
| pleasure    |        17 |
| strong         |     16 |
| anger           |    15 |

Obsessive word in Other by frequency

| Feature    | Frequency |
|------------|-----------|
| thought    | 5568      |
| think      | 4187      |
| want       | 2937      |
| love       | 974       |
| thought of | 699       |
| happy      | 699       |
| wondered   | 595       |
| lost       | 499       |
| miss       | 444       |
| interested | 432       |
| loved      | 396       |
| pleasure   | 357       |
| murder     | 355       |
| wished     | 329       |
| angry      | 321       |

Obsessive word in Other by frequency

 | Token  |       AF |  Per_10.6  | Carrolls_D2 |  Rosengrens_S |  Lynes_D3  |    DC  | Juillands_D   |   DP  | DP_norm |
 | --------- |------| ---------- |-------------| -------------- |----------| ------- |------------- |------- |---------|
 | thought  |   6510  | 2534.408    |     0.791  |        0.978   |   0.314 |   0.561   |      0.958 |  0.098  |   0.098 |
 | think     |  4550  | 1771.361      |   0.767    |      0.954    |  0.243  | 0.499     |    0.942  | 0.123  |   0.124 |
 | want     |   3107  | 1209.586     |    0.766   |       0.952   |   0.218  | 0.496    |     0.941 |  0.129  |   0.129 |
 | love      |  1066   | 415.004       |  0.757     |     0.850   |   0.122 |  0.438     |    0.876 |  0.260  |   0.260 |

Dispersion of four most frequent tokens related to obsession both
Carol and Other subcorpora

| phrase before                    | keyword     | phrase after                    |
|--------------------------------:|:-----------:|:-------------------------------|
| she was still beautiful therese  | **thought** | with a sudden pang of           |
| heard all around her she         | **thought** | of carol over a thousand        |
| hurt now beyond what you         | **think**   | you can bear and if             |
| if i miss you i                  | **think**   | of your voice your hands        |
| a tense excitement made her      | **want**    | to plunge headlong into it      |
| carol couldn't and wouldn't even | **want**    | to see her again has            |
| felt for carol was it            | **love**    | or wasn't it that she           |
| passed all the tests for         | **love**    | and fitted all the descriptions |
| she loved and would always       | **love**    | oh in a different way           |
| therese closed her eyes i        | **love**    | you carol said therese opened   |


Examples of strong obsessive emotion in Carol

| phrase before                 | keyword     | phrase after                   |
|-----------------------------:|:-----------:|:------------------------------|
| show her the dolls she        | **thought** | the child might like she       |
| i was so near i               | **thought** | i'd come up he said            |
| book of english verse i       | **think**   | i left it on top               |
| women's room who does he      | **think**   | he is mr frankenberg yoo-hoo   |
| the sweater department if you | **want**    | to ask me anything the         |
| only half finished i don't    | **want**    | my coffee therese said because |
| of rye how nice i'd love      | **love**    | one therese carol got up       |
| when you are alone i          | **love**    | this town because it all       |

Examples of weak obsessive emotion in Carol

| phrase before                       | keyword     | phrase after                   |
|-----------------------------------:|:-----------:|:------------------------------|
| towards the coffee table disturbing | **thought** | that and was it the            |
| and another name kidnapping tom     | **thought** | that might come next certainly |
| why should he complain he           | **thought** | as he stared out his           |
| police it was suicidal to           | **think**   | of leaving the country as      |
| he didn't want her to               | **think**   | he hadn't claimed it imagine   |
| more enthusiastic he began to       | **think**   | of how the water but           |
| for a while he didn't               | **want**    | to be frank pierson so         |
| had done them he didn't             | **want**    | to be a murderer sometimes     |
| now ballads which he didn't         | **love**    | as much as he loved            |
| and Marge loving it She'd           | **love**    | it even if he tortured         |

Examples of strong obsessive emotion in the Ripley series

| phrase before             | keyword     | phrase after                       |
|-------------------------:|:-----------:|:----------------------------------|
| for a few minutes heloise | **thought** | he took it too seriously           |
| it on his return tom      | **thought** | he turned left and walked          |
| us for lunch i don't      | **think**   | so thank you dear enjoy            |
| i'd drive you i don't     | **think**   | you can reach teresa tonight       |
| for lunch at l'aigle noir | **want**    | to join us for lunch               |
| dinner at eight if you    | **want**    | to join us come down               |
| asked quietly are you in  | **love**    | with marge dickie no but           |
| and keep me posted with   | **love**    | dickie tom read it over            |
| had said to frank you'll  | **love**    | the berlin-tegel airport tom liked |

Examples of weak obsessive emotion in the Ripley series

# Discussion

## Findings

The keyness analysis showed that one of the differences in key words for
both subcorpora is due to the different character names used in the two
subcorpora. For instance, "Therese", "Carol" and "Abby" were key words
in the Carol subcorpus with log-likelihood (LL) greater than 8000 for
"Therese" and "Carol", and LL greater than 1200 for "Abby". The
log-ratio was greater than 8 for all three key words, which means that
they appeared about 256 times more in the Carol subcorpus than
Highsmith's other works. The reason behind this difference is that none
of Highsmith's other works had main characters named "Therese" and
"Carol" and "Abby". Another difference in key words in both subcorpora
is due to differences in the frequencies of gender pronouns used in two
subcorpora. Male pronouns such as "he", "his", and "him" appear about 4
times more in Highsmith's other published works than *Carol*, and female
pronouns such as "she" and "her" appear about 2.8 times more in *Carol*
than other published works. The difference might be because many of
Highsmith's novels feature a male protagonist, such as Tom Ripley in the
Ripley Series, Guy Haines in *Strangers on a Train*, and Walter
Stackhouse in *The Blunderer*. This result confirms that *Carol* is an
exception to Highsmith's usual novels that follow the psychological
development of a male protagonist as a love story between two women.

There seems to be a common theme of obsession which persists throughout
Patricia Highsmith's writing. The histograms showed that there is a
difference between the means of the observed proportion of words related
to obsession in Carol and Other subcorpora. Log-likelihood test and log
ratio confirmed that there is a statistically significant difference
between the means of observed proportion between the two subcorpora. The
effect size is about 0.23, meaning that the observed proportion in
*Carol* is about 1.17 times greater than the mean observed proportion in
other published works. The results suggest that the theme of obsession
is stronger in Carol than in some of the other novels and short stories
that Patricia Highsmith has written. The theme of obsession does seem to
be present in all her novels and short stories as the observed
proportion of obsession is greater than 0.8 for all her published works.

Finally, the words tagged as obsessive seem to vary in their degree of
obsession based on what context the words are used in. KWIC analysis
showed that for the four most frequently appearing tokens related to
obsession ("thought", "think", "want", and "love"), the words were
present in sentences with both strong and weak obsessive emotions. For
*Carol*, it seemed like the word "love" was strongly associated with
obsession. The reason why "love" is strongly associated with obsession
might be because one of the major themes of *Carol* is love. Therese's
obsession with Carol stems from her romantic interest towards Carol. For
the Ripley series, it seemed like the words "thought" and "think" were
strongly associated with obsession. The reason why "thought" and "think"
are strongly associated with obsession might be because the Ripley
series is told from the point of view of Tom Ripley, and Ripley's
internal thoughts as he obsessively architects crimes for personal gain
are shared with the reader.

## Strengths and Weaknesses

One strength of this study is that the corpus contains most of the
published works of Patricia Highsmith, except for her diaries and joint
works with other authors. Another strength of the analysis is that a
log-likelihood test is more resistant to corpora of varying sizes
compared to a Chi-square test. Therefore, a log-likelihood test is more
appropriate for analyzing two subcorpora with very different sizes.

One limitation of the selected corpus in addressing the research
question is that there is only one novel, Carol, in one of the two
subcorpora. Therefore, it is not feasible to generalize whether or not
Patricia Highsmith tends to write love stories and psychological
thrillers differently since the Carol subcorpus consists of only one
text. The findings in this study is limited to analyzing how *Carol*
differs from her psychological thrillers. Another limitation of the
analysis is that the words in the obsession dictionary was chosen solely
by the author's judgement. There might have been personal biases that
affected how the words were selected. Also, the words in the obsession
dictionary was mostly referenced from a single lexicon and not from
multiple sources.

## Future work

One possible future work is validating that the obsession dictionary
accurately characterizes the theme of obsession by testing the
dictionary on various texts with differing levels of obsessive theme. It
would be interesting to repeat the analysis for different authors and
genres. Other possible future works are: (1) expanding on the obsession
dictionary by adding new words related to obsession and (2) increasing
the specificity of the obsessive emotion by separating the dictionary
into multiple levels. Currently, the dictionary has only one level with
a mix of words with positive and negative sentiments. It would be
interesting to separate the different sentiments of obsession.

# Sources

[1] R. Shore. The Talented Ms Highsmith. url: https://www.theguardian.com/film/2000/jan/28/ crimebooks.

[2] Every Man Is A Victim of the Female Caricature in Patricia Highsmith’s Little Tales of Misogyny. url: https://theopiatemagazine.com/2017/07/26/every-man-is-a-victim-of-the- female-caricature-in-patricia-highsmiths-little-tales-of-misogyny/.

[3] WordSmith Tools. Definition of Keyness. url: https://lexically.net/downloads/version7/ HTML/keyness_definition.html.

[4] M. Scott. “PC analysis of key words — And key key words”. In: System 25.2 (1997), pp. 233– 245. issn: 0346-251X. doi: https://doi.org/10.1016/S0346-251X(97)00011-0. url: https: //www.sciencedirect.com/science/article/pii/S0346251X97000110.

[5] S. Mohammad. NRC Emotion Lexicon. url: https://saifmohammad.com/WebPages/NRC- Emotion-Lexicon.htm.

[6] R. McDougall. The Many Faces of Patricia Highsmith. url: https://www.nytimes.com/2021/ 04/19/t-magazine/patricia-highsmith-talented-mr-ripley.html.

[7] N. Chowdhury. Keyword in Context Special Issue Spring 2020. url: https : / / cpb - us - w2 . wpmucdn.com/people.smu.edu/dist/3/1174/files/2020/04/KWIC-Analysis-Guide-NC-1.pdf.

# Appendix

## Obsession Lexicon

This is dictionary of 432 words related to obsession. The words were
mostly selected from NRC Word-Emotion Lexicon, but some were manually
added after filtering through lists of synonyms related to obsession.

abandoned abandonment absorb absorbed ache aching addicted addiction
admire admired admiring affinity agitated anger angry anguish animal
annoy annoyed anxiety anxious arousal arouse aroused ashamed attracted
attraction attractive awestruck awful baffle baffled betrayal betrayed
bias biased bitter bitterly blatant blatantly bliss blunder blush brutal
brutality brute buzz buzzed can't stop cannot stop captivate captivated
ceaseless ceaselessly charm charming choke choking climax collapse
collapsing compelling complex compulsed compulsive concerned
consciousness consciously conscious constant constantly consumed
continous continual continually continuously convict conviction convince
convincing copy copycat could not stop couldn't stop craze creep
creeping criminal cripple crippled crumble crumbling crush crushing
dazed dazzle dazzling defenseless delirious delirium delusion depress
depressed depressing depression depressive deranged desire desired
despair desparate desparining destroyer destructive destryoed determined
devastate devastating devastation disgusted distorted distorting
distract distracted distracting distraught distress distressed
distressing distrubance disturbed driven drown drowning ecstasy elated
elation enchant enchanted endless endlessly engulf enigmatic enjoy
enrage enraged enraptured enslaved enthrall entrance entranced envious
envy epitome erotic erratic eternal eternally everlasting exasperate
exasperated exasperating excess excessively excruciating explode
exploded extreme fanatic fanatical fanatically fancy fascinate
fascinated fascinating fierce fixated fixation flood flooded focus
focused focusing frantic frustrated furious grip gripped guilt guilty
happily happiness happy hated hating hatred heartache histerical
hopeless hopelessly hypnotize hypnotized hypnotizing hysteria immense
impatient impatiently impulsive incense incensed incessant indignant
indignation infatuated infatuation infinite infuriate infuriated insane
insanely insanity instinct instinctive instinctively intense intensely
interest interested interesting intimate intimately intruder intrusion
intrusive invade invader invasion irate irratate irrational irrationally
irrepressible irritably irrtated jealous jealously jealousy joy joyful
joyous kiss kissing lament lamenting lawless lost lovable love loved
loving lunacy lunatic lust mad madden maddened madness magical magnetize
magnetized mania maniac mesmerize mesmerized mimic mimiced mimicing
mimicry miserable miserable miserably misery miss missed moan moaning
moody murder murderer murderous mysterious mystery nauseous necessity
nervous neverending nonstop obsessed obsessing obsession obsessional
obsessionally obsessive outraged overbearing overdose overflow overgrow
overjoyed overload overpower overpowering overtake overtaken overwhelm
overwhelming overwhemling overwhlemed pain painful painfully panic
panicked paralysis paralyzed paranoia passion passionate passionately
perennial perpetual perpetually persistent perturbed pleasure possess
possessed powerful powerless preoccupation preoccupied prepossessed prey
protect protecting protective protector rapture recurrent relentless
relentlessly restless sad satanic saturate saturated sex sexiness sexy
shifting shudder sickening soak soaked spellbind stifle stifling
strangling stressed strong submerge submerged suffer suffering
suffocating suffocation sustained sustaining swamp swamped temperamental
temptation think about think thinking about thought of thought thrill
tireless track tracking tragic train of thought transfix transfixed
turbulent unbroken uncease unceaseingly unconscious unconsciously
unconstrained uncontrollable unending unendingly unflagging
uninterrupted unleash unrelenting unrelieved unremitting unsettled
unshakeable unswerving untiring unwearying unyielding upset upsetting
violence violent violently volatile want wanting wavering wish wished
wonder wondered wretched zealous

## Code Appendix


    # Load in libraries
    library(readtext)
    library(quanteda)
    library(quanteda.textstats)
    library(cmu.textstat)
    library(tidyverse)
    library(knitr)
    library(janitor)
    library(ggraph)
    library(kableExtra)

    ## A. Text processing

    ### A.1 Readtext

    # Use readtext function from readtext package to read in text files
    rt_carol <- readtext("/Users/rachelhyeon/Desktop/36-668_Text_Analysis/Final_Project/Corpus/ph-txt-processed-final/carol/*.txt",
                         docvarsfrom = "filenames",
                         dvsep = "-",
                         docvarnames = c("title", "type", "subcorpus"))

    rt_other <- readtext("/Users/rachelhyeon/Desktop/36-668_Text_Analysis/Final_Project/Corpus/ph-txt-processed-final/other/*.txt",
                         docvarsfrom = "filenames",
                         dvsep = "-",
                         docvarnames = c("title", "type", "subcorpus"))

    rt_all <- rbind(rt_carol, rt_other)

    # Ripley series
    rt_ripley <- readtext("/Users/rachelhyeon/Desktop/36-668_Text_Analysis/Final_Project/Corpus/ph-txt-processed-final/other_sorted/Ripley/*.txt",
                          docvarsfrom = "filenames",
                          dvsep = "-",
                          docvarnames = c("title", "type", "subcorpus"))

    ### A.2 Create corpus object

    # Make a corpus object
    carol_corpus <- corpus(rt_carol)
    other_corpus <- corpus(rt_other)
    ripley_corpus <- corpus(rt_ripley)
    all_corpus <- corpus(rt_all)

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

    # Tokenize Ripley Series
    ripley_tokens <- tokens(ripley_corpus, include_docvars=TRUE, remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE, what = "word")
    ripley_tokens <- tokens_tolower(ripley_tokens)

    ## B. Descriptive statistics

    ### B.1 Dispersion

    # Dispersion for all text
    all_dfm <- dfm(all_tokens)
    dispersion_all <- dispersions_all(all_dfm)
    dispersion_all_rounded <- dispersion_all %>% 
      mutate_if(is.numeric, round, digits=3)

    # Print in a nice table
    kable(head(dispersion_all_rounded, 15), booktabs = TRUE)

    # Dispersion for 4 most frequent words in obsession dictionary
    disp_4words <- dispersion_all_rounded %>%
      filter(Token %in% c("thought", "think", "want", "love"))

    # Print in a nice table
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
    # Keyness with effect size
    carol_dfm <- dfm(carol_tokens)
    other_dfm <- dfm(other_tokens)

    carol_kw_2 <- keyness_table(carol_dfm, other_dfm)
    other_kw_2 <- keyness_table(other_dfm, carol_dfm)

    # Print in a nice table
    kableExtra::kbl(head(carol_kw_2, 20), caption = "Tokens with the highest keyness values in Carol subcorpus when compared to Other subcorpus", booktabs = T, linesep = "", digits = 2) %>%
      kableExtra::kable_styling(latex_options = "HOLD_position") %>%
      kableExtra::kable_classic()

    kableExtra::kbl(head(other_kw_2, 20), caption = "Tokens with the highest keyness values in Other subcorpus when compared to Carol subcorpus", booktabs = T, linesep = "", digits = 2) %>%
      kableExtra::kable_styling(latex_options = "HOLD_position") %>%
      kableExtra::kable_classic()

    ## C. Lexicon analysis

    ### C.1 Observed proportion of obsessive words

    # Load dictionary/lexicon for obsession
    ps_dict <- dictionary(file = "/Users/rachelhyeon/Desktop/36-668_Text_Analysis/Coffee_Break_Experiments/CBE2/ps_dict_3.yml")

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

    # Print in a nice table
    kable(obs_total_2, caption = "Obsession token count, total tokens, and observed proportion for every text",
          booktabs = TRUE)

    # Processing for corpus composition table
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

    # Print in a nice table
    kable(corpus_comp, caption = "Corpus Composition of Carol and Other subcorpora")

    # Histogram of observed proportion
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

    # Calculate log-likelihood
    log_like(obs_carol$obsession, sum(obs_other$obsession), obs_carol$tokens_total, sum(obs_other$tokens_total))

    # Calculate log-ratio
    log_ratio(obs_carol$obsession, sum(obs_other$obsession), obs_carol$tokens_total, sum(obs_other$tokens_total))

    ## D. KWIC

    # KWIC on carol
    carol_kwic <- kwic(carol_tokens, ps_dict)

    # Extract out obsessive words in Carol
    carol_obs_keywords <- carol_kwic$keyword

    # Calculate frequency of obsessive words
    carol_obs_dfm <- dfm(tokens(carol_obs_keywords))
    carol_obs_frequency <- textstat_frequency(carol_obs_dfm) %>%
      select(c(feature, frequency)) %>%
      rename(Feature = feature, Frequency = frequency)

    # Display in a nice table
    kable(head(carol_obs_frequency, 15))

    # KWIC for 4 words
    carol_4words_kwic <- kwic(carol_tokens, pattern=c("thought", "think", "want", "love"), window = 5)

    # Extract out obsessive words in other subcorpus
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

    # Display in a nice table
    kable(head(other_obs_frequency, 15))

    # KWIC for 4 words
    ripley_4words_kwic <- kwic(ripley_tokens, pattern = c("want"), window = 5)
