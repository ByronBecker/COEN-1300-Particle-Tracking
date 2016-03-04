function output = wordScramble(word);

output = [''];
% creates a blank output matrix

k = randperm(length(word));
% scrambles values 1 through length of word

for i = 1:length(word)
    output(i) = word(k(i));
    % output i is equal the letter at the first value of the mixed matrix,
    % or k
end



end
