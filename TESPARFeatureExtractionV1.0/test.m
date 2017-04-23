clear; 

matrix = zeros(5,5);

for i=1:5
    for j=1:5
        matrix(i, j) = matrix(i, j) + 1;
    end
end























% %% Test
% filteredData = [1, 10 ,2, 3, 2, -1, -2, -1, 1, 2, 0, -1, 1,0, 1,10];
% 
% filteredData = filteredData*(-1);
% array  = zeros(10, 2);
% row = 1;
% array(1, 1) = 1;
% for i = 1:length(filteredData) - 1
%     if ( ((filteredData(i) > 0 || filteredData(i) == 0) && filteredData(i+1) < 0 ) || ...
%           (filteredData(i) < 0 && (filteredData(i+1) > 0 || filteredData(i+1) == 0)) )
%         array(row, 2) = i;
%         row = row + 1;
%         array(row, 1) = i+1;
%     end
% end
% 
% % array(row, 2) = lengtdiff = zeros(255, 1);
% % for i=1:row-1
% %     diff(i) = epochs(i+1, 2) - epochs(i, 2); 
% % end
% % h(filteredData);
% 
% 
% % 

% alternative to calculating D/S matrix
% DSmatrix2 = zeros(62, 6);
% 
% for i=1:62
%     for j=1:6
%         for k=1:row % looping through epochs
%             
%             if( (i==DSinfo(k, 1)) && (j== DSinfo(k, 2)+1) )
%                 DSmatrix2(i, j) = DSmatrix2(i, j) + 1;
%             end
%             
%         end
%     end
% end
