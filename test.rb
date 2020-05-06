require 'byebug'
require 'pdf-reader'
require 'open-uri'

io = open('https://s23.q4cdn.com/714267708/files/doc_downloads/PTP_307111_SAMPLEPARTNERA_K1_2018_FED.PDF')
receiver = PDF::Reader::RegisterReceiver.new
reader = PDF::Reader.new(io)
reader.pages.each do |page|
    if page.number == 3
page.walk(receiver)
receiver.callbacks.each do |cb|
        if cb.values.first.to_s =="show_text"
            puts cb[:args].to_a
            
    end
end
end
end


