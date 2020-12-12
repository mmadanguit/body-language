%%%
%%% Identifies motions based on filename
%%%

function [id] = identify_motion(filenames)
   
    id = {}; 
    for file = 1:length(filenames)
        name = filenames{file};
        name = split(name, {'/', '-'});
        name = name{2};
        id{file} = name; 
    end
    
end