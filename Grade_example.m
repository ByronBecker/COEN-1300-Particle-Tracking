grades = importdata('grades.csv');
max_scores = [25, 10, 100, 200, 200, 200];
weights = [.3, .12, .1, .15, .15, .18]; % sets weights for each element

for i = 1:size(grades, 1);   % gives a list of vector that goes from 1 to the # of lines
    % at each iteration of loop, i takes a value from the rows
    display(i); % displays i
    student_grades = grades(i, :) % organizes student_grades to all columns corresponding to row i
    display(student_grades); % test displays student_grades
    total_homework = sum(student_grades(1:10));  % defines totatl homework as sum of first 10 input column grades
    % could also write as sum(student_grades(1,1:10))
    total_homework = total_homework/(max_scores(1)*10); % gives the percentage recieved on homework
    % by taking the total homework score over the 1st index max_scores *
    % the # of homeworks
    total_quizzes = sum(student_grades(11:15));
    total_quizzes = total_quizzes/(max_scores(2)*5) 
    % could also write as sum(student_grades(1,10:15))
    final_project = student_grades(16)/max_scores(3); % no sum feature needed for these single components
    midterm1 = student_grades(17)/max_scores(4);
    midterm2 = student_grades(18)/max_scores(5);
    final_exam = student_grades(19)/max_scores(6);
    grade_components = [total_homework total_quizzes final_project midterm1 midterm2 final_exam];
    % organizes all grade data into 6 columns of the above
    final = 0;
    grade_components = grade_components * 100;
    for j = 1:6;
        final = final + grade_components(j) * weights(j);
    end
    
    
    % or can use dot product
    % grade_components = grade_components .* weights;
    % final = sum(grade_components);
    % display(final);
    
    
        