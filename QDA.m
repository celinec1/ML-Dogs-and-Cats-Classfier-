%This function takes in a data matrix Xrun as well the mean vectors mu0, mu1 
%and the covariance matrices sigma0, sigma1 estimated from the training data
%and produces a column vector guesses, corresponding to the ML rule for Gaussian vectors
%with different means and different covariance matrices, which is referred to as 
%Quadratic Discriminant Analysis (QDA) in machine learning.
function guesses = QDA(Xrun,mu0,mu1,sigma0,sigma1)
%inverted 
sigma0_inv= pinv(sigma0);
sigma1_inv= pinv(sigma1);
%calculating the log determinant of the cov matrices
logdetsigma0= sum(log(eig(sigma0)));
logdetsigma1= sum(log(eig(sigma1)));

%used ML rule for Gaussian vectors with different means and different
%matrices
[x y] = size(Xrun);
    for i = 1:x
        currentdata = Xrun(i,:);
        llh0 = -0.5 * ((currentdata - mu0) * sigma0_inv * transpose(currentdata - mu0) + logdetsigma0);
        llh1 = -0.5 * ((currentdata - mu1) * sigma1_inv * transpose(currentdata - mu1) + logdetsigma1);

        if (llh0 <= llh1)
            guesses(i) = 1;
        else if (llh0 > llh1)
            guesses(i) = 0;
        end
    end
        guesses = transpose(guesses);

end