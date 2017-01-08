function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

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

                        % active Code Here
optimal_C = 0.01;
optimal_sigma = 0.01;
min_error = 1000;
for test_C = [0.01 0.03 0.1 0.3 1 3 10 30]
    for test_sigma = [0.01 0.03 0.1 0.3 1 3 10 30]
        model = svmTrain(X, y, test_C, @(x1, x2) gaussianKernel(x1, x2, test_sigma));
        predictions = svmPredict(model, Xval);
        err = mean(double(predictions ~= yval));
        if min_error > err
            min_error = err;
            optimal_C = test_C;
            optimal_sigma = test_sigma;
        endif
        fprintf("C = %f\nsigma = %f\nerror = %f\n", test_C, test_sigma, err);
    end
end
fprintf("optimal C = %f, optimal sigma = %f\n", optimal_C, optimal_sigma);
C = optimal_C;
sigma = optimal_sigma;

                        % result Here
% C = 1;
% sigma = 0.1;



% =========================================================================

end
