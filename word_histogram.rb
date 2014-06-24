print "some words, please: "
input = gets.chomp
words = input.split(" ")

frequencies = Hash.new (0)

words.each { |word| frequencies[word] += 1 }

frequencies = frequencies.sort_by do |word, count| 
    count
end

frequencies.reverse!

frequencies.each do |word, freq| 
    print word 
    # add padding to 25 chars - length of word
    padding_length = 25 - word.length
    padding_length.times { print " " }
    # print histogram for frequency
    freq.times { print "=" }
    print "\n"
end

puts

=begin
sample text: copy next line: 

At this pivotal moment for Afghanistan, one of the two candidates for president, Abdullah Abdullah, is creating a political crisis by trying to interrupt the vote-counting in Saturday’s runoff. On Wednesday, he demanded that the election commission stop counting ballots and withdrew his election observers from the process. This could be catastrophic for Afghanistan, which is still very fragile and under grave threat from the Taliban. If no winner is decided, there is likely to be a protracted political struggle along ethnic lines that could make it impossible to transfer power democratically. The uncertainty would paralyze government decision-making and prevent the signing of a security agreement that would allow the United States to leave a residual force in Afghanistan after combat troops depart later this year. Mr. Abdullah’s complaint is that his opponent, Ashraf Ghani, and President Hamid Karzai orchestrated a huge fraud in the vote, a charge both Mr. Ghani and Mr. Karzai have denied. But Mr. Abdullah believes he was cheated when he came in second to Mr. Karzai in 2009 and is trying to pre-empt defeat this time. Afghanistan is new to democratic practices and given its history of tribal-based politics and widespread corruption, many people, including international experts and American officials, have assumed some level of fraud in the balloting. The issue this time, as in the elections that gave Mr. Karzai two terms as president, is whether the fraud was so substantial that voters could not accept whatever results emerged. Mr. Abdullah led Mr. Ghani in the first round of voting in April, and supporters believe he has picked up enough additional support to win the runoff. He has alleged that as many as two million of seven million votes estimated to have been cast were because of ballot-box stuffing, most in favor of Mr. Ghani. He also claims that at least one senior member of the Independent Election Commission has tried to rig the election for Mr. Ghani. The problem is that no official vote tallies have been released by the election commission, and Mr. Abdullah has, so far, presented no firm proof to support his allegations. Moreover, he is now rejecting a process laid out under Afghan law that he initially accepted and seems to be repudiating the very protections that were put in place to adjudicate fraud and other election complaints. He is entitled, for instance, to ask the commission to investigate irregularities, but that is supposed to happen after the partial vote results are announced in the next few weeks. The United States and the United Nations, which has been instrumental in advising Afghan on its election procedures, have prudently not taken sides. In a bluntly worded statement, the United Nations called for the candidates to respect the national electoral system they promised to participate in when they opened their campaigns. A senior American official, James Dobbins, testifying before Congress this week, urged the candidates and their supporters not to prejudge the outcome. As hard as it is to lose, both candidates have to be prepared for such a result. Political uncertainty could lead the United States and other international donors to rethink their commitment of monetary aid and other support in the future. That is not an outcome that Afghanistan can afford.
	
=end