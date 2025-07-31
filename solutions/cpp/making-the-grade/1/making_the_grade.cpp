#include <array>
#include <string>
#include <vector>
#include <algorithm>
#include <numeric>
#include <functional>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
	std::vector<int>res(student_scores.size());
	std::transform(student_scores.begin(),
				   student_scores.end(),
				   res.begin(),
				   [](double score)->int {
		return static_cast<int>(score);
	});
	return res;
}


// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
	return std::reduce(student_scores.begin(),
					   student_scores.end(),
					   0,
					   [](int acc, int score) -> int {
		return score <= 40 ? acc + 1 : acc; 
	});
    
}

// Determine how many of the provided student scores were 'the best' based on the provided threshold.
std::vector<int> above_threshold(std::vector<int> student_scores, int threshold) {
	std::vector<int> filtered;

	for (auto score : student_scores) {
		if (score >= threshold)
			filtered.push_back(score);
	}
	
    return filtered;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
    int step = (highest_score - 40) / 4;
	
    return {
		41, 41 + step, 41 + (2 * step), 41 + (3 * step)
	};
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(std::vector<int> student_scores, std::vector<std::string> student_names) {
	std::vector<std::string> rank(student_names.size());
	for (int i = 0; i < student_names.size(); ++i) {
		rank.at(i) = std::to_string(i + 1) + ". "
			+ student_names.at(i) + ": "
			+ std::to_string(student_scores.at(i));
	}
    return rank;
}

// Create a string that contains the name of the first student to make a perfect score on the exam.
std::string perfect_score(std::vector<int> student_scores, std::vector<std::string> student_names) {
    for (int i = 0; i < student_names.size(); ++i) {
		if (student_scores.at(i) == 100)
			return student_names.at(i);
	}
    return "";
}
