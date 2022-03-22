# You need to write a function that takes a sentence in a single string.
# This function should split the sentence into words and then convert all the words to lower case.
# It should then remove all the "stop words" from this list.

# Stop words are words like "the", "a", "an" etc. which are removed from sentences before performing natural langauge processing on them.
# You can find a comprehensive list of stop words here: http://xpo6.com/list-of-english-stop-words/

# After removing stop words, the function should create a dictionary that keeps a count of the number of words in the whole sentence.

# Write this function cleanly using the pipe operator.

defmodule Files do
  def read_lines(path) when is_binary(path) do
    path
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
  end
end

defmodule PipeTest do
  defp to_downcase_list(sentence) do
    sentence
    |> String.trim()
    |> String.split()
    |> Enum.map(fn w -> String.downcase(w) end)
  end

  defp remove_stop_words(wordlist, stopwords) do
    wordlist |> Enum.filter(fn w -> w not in stopwords end)
  end

  def count_words(words) do
    words
    |> Enum.reduce(
      %{},
      fn word, acc -> Map.update(acc, word, 1, &(&1 + 1)) end
    )
  end

  def count_non_stopword_words(stopwords, sentence) do
    sentence
    |> to_downcase_list()
    |> remove_stop_words(stopwords)
    |> count_words()
  end
end

counters =
  "../data/stopwords.txt"
  |> Files.read_lines()
  |> PipeTest.count_non_stopword_words("HOLA hola que que a what QUE TAL")

IO.inspect(counters)
