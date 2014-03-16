require 'seedr/acts_as_seedrable'
module Seedr
  # RANDOMS
  
  def self.random_string(length=1)
    range = [*'a'..'z', *'A'..'Z']
    Array.new(length){range.sample}.join
  end
  
  def self.random_integer(length=1)
    range = [*0..9]
    Array.new(length){range.sample}.join
  end
  
  def self.random_float(min=0,max=10)
    rand * (max-min) + min
  end
  
  def self.random_decimal(min=0,max=10,precision=2)
    self.random_float(min,max).round(precision)
  end
  
  def self.random_boolean
    [0,1].sample
  end
  
  def self.random_word
    ['sed', 'posuere', 'consectetur', 'est', 'at' 'lobortis', 'lorem', 'ipsum', 'dolor', 'sit', 'amet', 'consectetur', 'adipiscing' 'elit', 'nullam', 'id', 'dolor', 'id', 'nibh', 'ultricies', 'vehicula', 'ut', 'id', 'elit', 'maecenas', 'sed', 'diam', 'eget', 'risus', 'varius', 'blandit', 'sit', 'amet', 'non', 'magna'].sample
  end
  
  def self.random_sentences
    [
      "This here's a story all about how my life got flipped, turned upside down.  Now I'd like to take a minute, just sit right there.  I'll tell you how I became the prince of a town called Bel Air.",
      "How much wood could a woodchuck chuck if a woodchuck could Chuck Norris.",
      "You smell that? Do you smell that? Napalm, son. Nothing else in the world smells like that. I love the smell of napalm in the morning.",
      "You know the thing about a shark, he’s got lifeless eyes. Black eyes like a doll’s eyes. When he comes at ya, he doesn’t seem to be living until he bites ya and those black eyes roll over and white and then, ah, then you hear that terrible high-pitch screaming. The ocean turns red and despite all the pounding and hollering, they all come in and they rip you to pieces.",
      "In the name of God, do your duty. In the name of God, believe Tom Robinson.",
      "I am recognizing that the voices in my head are urging me to be myself and never follow someone else.  Opinions are like voices we all have a different kind, so just clean out all of your ears these are my views and you will find that we're revolutionizing with the kick and the snare.",
      "The good thing about science is it's true, whether or not you believe in it.",
      "Never trust a cat."
    ].sample
  end
  
  #DATES/TIMES
  
  def self.random_time(start=0.0,stop=Time.now)
    Time.at(start + rand * (stop.to_f - start.to_f))
  end
  
  def self.random_date(start=0.0,stop=Time.now)
    self.random_time(start,stop).to_date
  end
  
  def self.random_datetime(start=0.0,stop=Time.now)
    self.random_time(start,stop).to_datetime
  end
  
  
  # PROFILE
  
  def self.first_name
    ['Joe','Rob','Tim','John','Matt','Gob','Ricky','Bubbles','Walt','Sally','Natalie','Jane','Oscar','Lupe','Benjamin','Lindsay'].sample
  end
  
  def self.last_name
    ['Bluth','Morgan','Pinkman','Skywalker','Lahee','Griswald','Farakahn','Greenpoint','Seinfeld','Simpson','Briggs','Baxter'].sample
  end
  
  def self.middle_initial
    [*'A'..'Z'].sample
  end
  
  def self.username
    ['bewbewbew002','nicCage80085','murphdawg23','captain0bv3us','username123','jesuslovesme','grannyPants419','art_vandelay','theRealMacafee','iLoveScreech1492','thugLife187'].sample
  end
  
  def self.full_name
    "#{self.first_name} #{self.middle_initial}. #{self.last_name}"
  end
  
  def self.email_username
    ['bob', 'horace', 'jimmy', 'info', 'noreply', 'stuff', 'juan', 'daisuke', 'veronica', 'marge', 'inquiries'].sample
  end
  
  def self.hostname
    ['gmail', 'hotmail', 'yahoo', 'nytimes', 'runners', 'hotdating', 'cnn', 'maryjanetimes', 'nyc', 'navy', 'asheavenue','seacaptaindate','geocities'].sample
  end
  
  def self.tld
    ['com', 'net', 'io', 'gov', 'mil', 'co.uk', 'es', 'biz','info','edu'].sample
  end
  
  def self.email
    "#{self.email_username}@#{self.hostname}.#{self.tld}"
  end
  
  def self.phone_number(separator='')
    "#{self.random_integer(3)}#{separator}#{self.random_integer(3)}#{separator}#{self.random_integer(4)}"
  end
  
  def self.company_name
    word1 = ['ACME', 'American', 'International', 'Blue', "Dad's", 'Stargazer', 'East River', 'Nissan', 'Red', 'Standard']
    word2 = ['Computer', 'Plumbing', 'Construction', 'Welding', 'Mercantile', 'Design', 'Refrigeration', 'Shipping', 'Culinary', 'Dry Goods']
    word3 = [' Company', ' Society', ' Association', ' Union', ' Supply', '', '', '', '', '']
    word4 = [' of North Carolina', ', Inc.', ', LLC', '', '', '', '', '', '']
    "#{word1.sample} #{word2.sample}#{word3.sample}#{word4.sample}"
  end
  
  def self.address_line_1
    direction = ['N.', 'S.', 'E.', 'W.', 'North', 'South', 'East', 'West']
    street = ['First', 'Third', 'Franklin', 'Lakeland', 'Hillsborough', 'Pennsylvania', 'Cardigan', 'High', 'China Lake', 'Columbia']
    type = ['St.', 'Ave.', 'Blvd.', 'Rd.', 'Way', 'Court']
    "#{Random.rand(1000)} #{direction.sample} #{street.sample} #{type.sample}"
  end
  
  def self.address_line_2
    ["Apt. #{Random.rand(10) + 1}#{Array('A'..'G').sample}", "Suite #{Random.rand(90) + 1}", "#{Random.rand(10) + 4}th Floor"].sample
  end
  
  def self.city
    ['Lincoln', 'Orange', 'Ridgecrest', 'Springville', 'Laserville', 'Oak Ridge', 'Nashville', 'Los Gatos', 'Shreveport'].sample
  end
  
  def self.state(abbreviation=FALSE)
    if abbreviation
      ['CA', 'NC', 'OK', 'NY', 'UT', 'MT', 'OR', 'AZ', 'SC', 'KY', 'WV', 'VA', 'ME', 'FL'].sample
    else
      ['California', 'North Carolina', 'Oklahoma', 'New York', 'Utah', 'Montana', 'Oregon', 'Arizona', 'South Carolina', 'Kentucky', 'West Virginia', 'Virginia', 'Maine', 'Florida'].sample
    end
  end
  
  def self.province(abbreviation=FALSE)
    if abbreviation
      ['AB', 'SK', 'BC', 'NB', 'ON', 'QC', 'NS'].sample
    else
      ['Alberta', 'Saskatchewan', 'British Columbia', 'New Brunswick', 'Ontario', 'Quebec', 'Nova Scotia'].sample
    end
  end
  
  def self.country(abbreviation=FALSE)
    if abbreviation
      ['US', 'MX', 'CA', 'FR', 'ES', 'JP', 'SG', 'NM'].sample
    else
      ['United States', 'Mexico', 'Canada', 'France', 'Spain', 'Japan', 'Singapore', 'Namibia'].sample
    end
  end
  
  def self.image(width=FALSE,height=FALSE)
    placeToggle = ['','c/','g/']
    sizes = ['199','200','198','201','197']
    width = sizes.sample unless width
    height = sizes.sample unless height
    "http://www.placecage.com/#{placeToggle.sample}#{width}/#{height}"
  end
  
  
  # EDITORIAL
  
  def self.category
    ['News', 'Entertainment', 'Sports', 'Music', 'Technology', 'World', 'Arts', 'Real Estate', 'Style', 'Business', 'Finance', 'Classifieds', 'Travel', 'Food'].sample
  end
  
  def self.article_type
    ['Text', 'Video', 'Gallery', 'Poll'].sample
  end
  
  def self.series
    ['101', 'Grow', 'Art Talk', 'Fringes', 'Noisey Raps'].sample
  end
  
  def self.title
    words = ['sed', 'posuere', 'consectetur', 'est', 'at' 'lobortis', 'lorem', 'ipsum', 'dolor', 'sit', 'amet', 'consectetur', 'adipiscing' 'elit', 'nullam', 'id', 'dolor', 'id', 'nibh', 'ultricies', 'vehicula', 'ut', 'id', 'elit', 'maecenas', 'sed', 'diam', 'eget', 'risus', 'varius', 'blandit', 'sit', 'amet', 'non', 'magna']
    random_number_of_words = Random.rand(5) + 3
    "#{words.shuffle[0..(Random.rand(5) + 3)].join(" ").titleize}."
  end
  
  def self.body
    words = ['sed', 'posuere', 'consectetur', 'est', 'at' 'lobortis', 'lorem', 'ipsum', 'dolor', 'sit', 'amet', 'consectetur', 'adipiscing' 'elit', 'nullam', 'id', 'dolor', 'id', 'nibh', 'ultricies', 'vehicula', 'ut', 'id', 'elit', 'maecenas', 'sed', 'diam', 'eget', 'risus', 'varius', 'blandit', 'sit', 'amet', 'non', 'magna']
    random_number_of_paragraphs = Random.rand(6) + 1
    random_number_of_sentences = Random.rand(6) + 1
    random_number_of_words = Random.rand(10) + 3
    result = ""
    random_number_of_paragraphs.times do
      random_number_of_sentences.times do
        sentence = "#{words.shuffle[0..random_number_of_words].join(" ")}. "
        sentence = sentence.slice(0,1).capitalize + sentence.slice(1..-1)
        result += sentence
      end
      result += "\n"
    end
    result
  end
  
  # AR COLUMN TYPES
  
  def self.string
    self.random_string(8)
  end
  
  def self.text
    self.body
  end
  
  def self.integer
    self.random_integer(3)
  end
  
  def self.float
    self.random_float
  end
  
  def self.decimal
    self.random_decimal
  end
  
  def self.datetime
    self.random_datetime
  end
  
  def self.time
    self.random_time
  end
  
  def self.date
    self.random_date
  end
  
  def self.timestamp
    self.random_time
  end
  
  def self.boolean
    self.random_boolean
  end
end
