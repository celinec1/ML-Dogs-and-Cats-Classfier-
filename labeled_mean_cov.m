%This function takes in a data matrix X, corresponding vector 
%of labels Y, and a desired label. It outputs the the number 
%of samples with desiredlabel as n_label as well as the sample
%mean vector mu_label (as a row vector) and sample covariance 
%matrix sigma_label for the data in X whose labels in Y are equal
%to the desired label.

function [n_label,mu_label,sigma_label] = labeled_mean_cov(X,Y,desiredlabel)
%find the index of where the desiredlabel is in Y
    desiredlabel_index= find(Y==desiredlabel);
%data in X where Y is equaled to desired labels
    newdata= X(desiredlabel_index,:);
%finding the mean vector and sample cov matrix
    [n_label new_label]=size(newdata);
    sigma_label=cov(newdata);
    mu_label= mean(newdata);


end