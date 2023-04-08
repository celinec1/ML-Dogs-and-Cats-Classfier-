%This function takes in a data matrix Xrun as well the mean vectors mu0, mu1 
%and the covariance matrices sigma0, sigma1 estimated from the training data
%and produces a column vector guesses, corresponding to the ML rule for Gaussian vectors
%with different means and the same covariance matrix, which is referred to as 
%Linear Discriminant Analysis (LDA) in machine learning.
function guesses = LDA(Xrun,mu0,mu1,sigmapooled)
%invert sigmapooled
pooledinv = pinv(sigmapooled);
%created the cov matrix estimated from training data
var1 = 2 * pooledinv* transpose(mu1 - mu0);
var2 = mu1 * pooledinv*transpose(mu1) - mu0 * pooledinv * transpose(mu0);
%used the ML rule for Gaussian vectors with different means but same cov
%matrix
[x y] = size(Xrun);
for i = 1:x
    currentdata = Xrun(i,:);
    if ((currentdata*var1) >= var2)
        guesses(i) = 1;
    else if ((currentdata*var1) < var2)
        guesses(i) = 0;
    end
end
guesses = transpose(guesses);
end