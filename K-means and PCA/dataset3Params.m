function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
temp=10^6;
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

parameter_list=[0.01 0.03 0.1 0.3 1 3 10 30];
for i=1:length(parameter_list)
  C=parameter_list(i);
   for j=1:length(parameter_list)
	sigma=parameter_list(j);
        m=svmTrain(X,y,C,@(x1,x2)gaussianKernel(x1,x2,sigma));
	predictions=svmPredict(m,Xval);
	mean_pred_error=mean(double(predictions~=yval));
        if mean_pred_error<temp
		temp=mean_pred_error;
                final_c=C;
		final_sigma=sigma;
  	end
  end
end

C=final_c;
sigma=final_sigma;



% =========================================================================

end
