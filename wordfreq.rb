require('pry')

class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    @textfile = File.read(filename)
    # @textfile = File.read("emancipation_proclamation")
    # @textfile = File.read("seneca_falls")
    wordArray = @textfile.downcase.gsub(/[^a-z ]/, '').split(" ")
    @wordHash = Hash.new
    wordArray.each { |x|
      if STOP_WORDS.include?(x)
        # skip
      else
        @wordHash[x].nil? ? @wordHash[x] = 1 : @wordHash[x] += 1
      end
    }
    puts @wordHash
    # binding.pry
  end

  def frequency(word)
    @wordHash[word]
    #binding.pry
  end

  def frequencies
    #binding.pry
  end

  def top_words(number)
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
