# if you guess the spot exactaly its 5 points
# off by one 3 points
# off by 2 one point
# off by 3 - 4 0 points
# off by 5-6 -1 point
# off by 7+ -2 points

file_data = File.read("picks.csv").split(",")

miloEast = Array.new()
miloWest = Array.new()
billEast = Array.new()
billWest = Array.new()
reedEast = Array.new()
reedWest = Array.new()

count = 0
x = 2

file_data.each do|data|

    if count == 0 
        miloEast  << data # 0 
        count+=1
    elsif count == 1 
        miloWest  << data # 1
        count+=1
    elsif count == 2 
        billEast  << data # 2
        count+=1
    elsif count == 3 
        billWest  << data # 3
        count+=1
    elsif count == 4 
        reedEast  << data # 4
        count+=1
    else 
        reedWest  << data # 5 
        count = 0
    end
end

reedWest[9] = reedWest[9].split("\r")[0]

count = 0
newMiloEast = Array.new()

miloEast.each do |data|

    if count == 0
        newMiloEast << data
        count+=1
    else
        data2 = data.split("\n")
        # data3 = data2[1]
        # puts data3
        # print data2[1]
        newMiloEast << data2[1]
    end
end

# newbillWest = Array.new()

# billWest.each do |data|
#     newbillWest << data.split(" ")[1]
# end


eastStandings_data = File.read("east.txt").split("\n")
westStandings_data = File.read("west.txt").split("\n")

eastStandings_data2 = Array.new()
westStandings_data2 = Array.new()

count = 0
eastStandings_data.each do |data|
    if count == 1 
        eastStandings_data2 << data
        count+=1
    elsif count == 0
        count+=1
    elsif count == 2
        count = 0
    end    
end

count = 0
westStandings_data.each do |data|
    if count == 1 
        westStandings_data2 << data
        count+=1
    elsif count == 0
        count+=1
    elsif count == 2
        count = 0
    end    
end

# print eastStandings_data2
# print westStandings_data2

miloWest[0] = miloWest[0][1..-1] # if I wasn't lasy I would remove this whitespace when I formated the data :(
billEast[0] = billEast[0][1..-1] # if I wasn't lasy I would remove this whitespace when I formated the data :(
billWest[0] = billWest[0][1..-1]

milo_score = 0
bill_score = 0
reed_score = 0

count = 1
newMiloEast.each do |data|
    teamStanding = eastStandings_data2.find_index(data) 
    teamStanding+=1
    offBy = count - teamStanding
    offBy = offBy.abs

    if offBy == 0 
        milo_score+=5
        puts "#{data} is in the exact correct spot you rock"
    elsif offBy == 1
        milo_score+=3
        puts "#{data} is close you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    elsif offBy == 2
        milo_score+=1
        puts "#{data} is close you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    elsif offBy > 2 && offBy <5
        puts "oh well #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    elsif offBy > 4 && offBy <7
        puts "yikes #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
        milo_score-=1
    else
        puts "you are dumb! #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
        milo_score-=2
    end

    # puts "#{data} is off by #{offBy.abs} spots you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    count+=1
end

puts milo_score
count = 1
miloWest.each do |data|
    teamStanding = westStandings_data2.find_index(data) 
    teamStanding+=1
    offBy = count - teamStanding
    offBy = offBy.abs



    if offBy == 0 
        milo_score+=5
        puts "#{data} is in the exact correct spot you rock"
    elsif offBy == 1
        milo_score+=3
        puts "#{data} is close you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    elsif offBy == 2
        milo_score+=1
        puts "#{data} is close you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    elsif offBy > 2 && offBy <5
        puts "oh well #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    elsif offBy > 4 && offBy <7
        puts "yikes #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
        milo_score-=1
    else
        puts "you are dumb! #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
        milo_score-=2
    end

    # puts "#{data} is off by #{offBy.abs} spots you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    count+=1
end

puts milo_score

count =1
billEast.each do |data|
    teamStanding = eastStandings_data2.find_index(data) 
    teamStanding+=1
    offBy = count - teamStanding
    offBy = offBy.abs
    #print "teamstanding = #{teamStanding}, count = #{count}, offBy = #{offBy} "

    if offBy == 0 
        bill_score+=5
        puts "#{data} is in the exact correct spot you rock"
    elsif offBy == 1
        bill_score+=3
        puts "#{data} is close you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    elsif offBy == 2
        bill_score+=1
        puts "#{data} is close you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    elsif offBy > 2 && offBy <5
        puts "oh well #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    elsif offBy > 4 && offBy <7
        puts "yikes #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
        bill_score-=1
    else
        puts "you are dumb! #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
        bill_score-=2
    end

    # puts "#{data} is off by #{offBy.abs} spots you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    count+=1
end

puts bill_score
count = 1
billWest.each do |data|
    teamStanding = westStandings_data2.find_index(data) 
    teamStanding+=1
    offBy = count - teamStanding
    offBy = offBy.abs

    if offBy == 0 
        bill_score+=5
        puts "#{data} is in the exact correct spot you rock"
    elsif offBy == 1
        bill_score+=3
        puts "#{data} is close you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    elsif offBy == 2
        bill_score+=1
        puts "#{data} is close you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    elsif offBy > 2 && offBy <5
        puts "oh well #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    elsif offBy > 4 && offBy <7
        puts "yikes #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
        bill_score-=1
    else
        puts "you are dumb! #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
        bill_score-=2
    end

    # puts "#{data} is off by #{offBy.abs} spots you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    count+=1
end

puts bill_score

count =1
reedEast.each do |data|
    teamStanding = eastStandings_data2.find_index(data) 
    teamStanding+=1
    offBy = count - teamStanding
    offBy = offBy.abs
    #print "teamstanding = #{teamStanding}, count = #{count}, offBy = #{offBy} "

    if offBy == 0 
        reed_score+=5
        puts "#{data} is in the exact correct spot you rock"
    elsif offBy == 1
        reed_score+=3
        puts "#{data} is close you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    elsif offBy == 2
        reed_score+=1
        puts "#{data} is close you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    elsif offBy > 2 && offBy <5
        puts "oh well #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    elsif offBy > 4 && offBy <7
        puts "yikes #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
        reed_score-=1
    else
        puts "you are dumb! #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
        reed_score-=2
    end

    # puts "#{data} is off by #{offBy.abs} spots you picked them to be in #{count} but they are in #{eastStandings_data2.find_index(data)+1}"
    count+=1
end

puts reed_score
count = 1
reedWest.each do |data|
    teamStanding = westStandings_data2.find_index(data) 
    teamStanding+=1
    offBy = count - teamStanding
    offBy = offBy.abs

    if offBy == 0 
        reed_score+=5
        puts "#{data} is in the exact correct spot you rock"
    elsif offBy == 1
        reed_score+=3
        puts "#{data} is close you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    elsif offBy == 2
        reed_score+=1
        puts "#{data} is close you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    elsif offBy > 2 && offBy <5
        puts "oh well #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    elsif offBy > 4 && offBy <7
        puts "yikes #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
        reed_score-=1
    else
        puts "you are dumb! #{data} off by #{offBy.abs()} you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
        reed_score-=2
    end

    # puts "#{data} is off by #{offBy.abs} spots you picked them to be in #{count} but they are in #{westStandings_data2.find_index(data)+1}"
    count+=1
end

puts reed_score

# print westStandings_data2
# puts

# print("Milo east #{newMiloEast}")
# puts
# print("Milo west #{miloWest}")
# puts
# print("Bill east #{billEast}")
# puts
# print("Bill west#{billWest}")
# puts
# print("Reed east#{reedEast}")
# puts
# print("Reed east#{reedWest}")
# puts