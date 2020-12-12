%%%
%%% Test the motion model
%%%

function [id] = test_model(train_filenames, test_filename)
   
    train = train_model(train_filenames);
    train_id = identify_motion(train_filenames);
    [U,S,V] = svd(train);
    train_coef = U*train;
    
    test = train_model(test_filename);
    test_coef = U*test; 
    
    RMSE = sqrt(mean((train_coef - test_coef).^2));
    [M, I] = min(RMSE);
    id = train_id{I};
    
end