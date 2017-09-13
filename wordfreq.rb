require('pry')

class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with', 'she']

  def initialize(filename)
    @textfile = File.read(filename)
    wordArray = @textfile.downcase.gsub(/[^a-z ]/, ' ').split(" ")
    @wordHash = Hash.new
    wordArray.each { |x|
      if STOP_WORDS.include?(x)
      else
        @wordHash[x].nil? ? @wordHash[x] = 1 : @wordHash[x] += 1
      end
    }
  end

  def frequency(word)
    if @wordHash[word].nil?
      0
    else
      @wordHash[word]
    end
    #binding.pry
  end

  def frequencies
    @wordHash
    #binding.pry
  end

  def top_words(number)
    @wordHash.sort_by{|k,v| [-v,k]}.take(number).map{ |k,v| [k,v]}
    #binding.pry
  end

  def print_report # top ten words
    #binding.pry
  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
