%AW: see comments below. 0.9/1.


%Inclass assignment 8

%Using the swalign function
% A. Create a random DNA sequence of length 100. 
seq1=randseq(100);
% B. Create a second sequence from the first one by changing the middle 20 basepairs (at positions 41-60)
seq2=[randseq(40), seq1(41:60), randseq(40)]
% C. run swalign on the two sequences with the default parameters
swalign(seq1, seq2, 'Alphabet', 'nt','Showscore',true)
% D. run swalign with much higher and lower values of the GapOpen parameter
% and explain the results. 
%higher:
swalign(seq1, seq2, 'Alphabet', 'nt','GapOpen', 200, 'Showscore',true)
%lower:
swalign(seq1, seq2, 'Alphabet', 'nt','GapOpen', 1, 'Showscore',true)
%the higher one makes gaps prohibitively expensive, such that only straight
%diagonals are allowed, while the lower one allows for lots of gaps and can
%thus find a path that's not perfectly straight
%AW: this is correct but what does it mean in terms of the alignments produced. The former
% favors mismatches, the later favors gaps in the alignment. -.05. 


% E. run swalign with a low value of GapOpen but a high value of ExtendGap,
% explain the result
swalign(seq1, seq2, 'Alphabet', 'nt','GapOpen', 1, 'ExtendGap', 30, 'Showscore',true)
%the penalty for extending is too high and with the gap penalty low, it
%chooses a path with no/few jumps that is not perfectly straight(gaps)

%AW: not quite - it is willing to open gaps because the penalty is low, but they will be short (1bp). 

% F. run swalign align with the default value of GapOpen and a low value
% of ExtendGap and explain the result. 
swalign(seq1, seq2, 'Alphabet', 'nt', 'ExtendGap', 1, 'Showscore',true)
%now the penalty of extending the gap and jumping to a region far away is
%much lower and it chooses the path with a lot of extensions to different
%regions that have few gaps (and are straigt diagonals) to satisfy the
%higher gap penalty
%AW: i.e. there will be fewer gaps, but they will be longer. 
