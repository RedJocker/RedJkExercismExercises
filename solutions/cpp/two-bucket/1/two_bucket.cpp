#include "two_bucket.h"
#include <algorithm>
#include <stdexcept>

namespace two_bucket
{

	void transfer(bucket &from, bucket &to, int &num_moves) {
		int empty_volume = to.capacity - to.volume;
		int volume_to_transfer = std::min(empty_volume, from.volume);
		from.volume -= volume_to_transfer;
		to.volume += volume_to_transfer;
		num_moves++;
	}
	
	void empty(bucket &bucket, int &num_moves) {
		bucket.volume = 0;
		num_moves++;
	}
	
	void fill(bucket &bucket, int &num_moves) {
		bucket.volume = bucket.capacity;
		num_moves++;
	}

	bool is_full(bucket &bucket) {
		return bucket.volume == bucket.capacity;
	}

	bool is_empty(bucket &bucket) {
		return bucket.volume == 0;
	}

	static measure_result calculate(bucket &initial, bucket &other, int target){
		
		int num_moves = 0;

		while (true) {
			if (is_empty(initial))
				fill(initial, num_moves);
			transfer(initial, other, num_moves);
			if (initial.volume == target || other.volume == target)
				break;
			if (initial.volume == 0 && other.volume == other.capacity)
				throw std::domain_error("rule 3 break");
			if (is_full(other))
				empty(other, num_moves);
		}

		bucket &goal = initial.volume == target ? initial : other;
		bucket &remaining = initial.volume == target ? other : initial;
		
		return { num_moves,
				 goal.id,
				 remaining.volume };
	}

	measure_result measure(
	        int bucket1_capacity, 
			int bucket2_capacity,
	        int target_volume, 
			bucket_id start_bucket) {

		if (target_volume > bucket1_capacity && target_volume > bucket2_capacity)
			throw std::domain_error("impossible");
		
		bucket initial {
			start_bucket,
			start_bucket == bucket_id::one ? bucket1_capacity : bucket2_capacity,
			0
		};

		if (target_volume == initial.capacity)
			return {1, initial.id, 0};

		bucket other {
			start_bucket == bucket_id::one ? bucket_id::two : bucket_id::one,
			start_bucket == bucket_id::one ? bucket2_capacity : bucket1_capacity,
			0
		};

		if (target_volume == other.capacity)
			return {2, other.id, initial.capacity};		
		return calculate(initial, other, target_volume); 
	}
}

// #include <iostream>
// int main(void) {
// 	auto bucket1_capacity = 3;
//     auto bucket2_capacity = 5;
//     auto goal_volume = 1;
//     auto start_bucket = two_bucket::bucket_id::one;

//     auto actual = two_bucket::measure(
//             bucket1_capacity, bucket2_capacity,
//             goal_volume, start_bucket);

// 	std::cout << actual.other_bucket_volume;
// 	return (0);
// }
