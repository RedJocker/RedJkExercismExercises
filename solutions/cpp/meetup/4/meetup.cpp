#include "meetup.h"
#include <exception>

namespace meetup {

	scheduler::scheduler(boost::date_time::months_of_year month, short unsigned int year) {
		this->date =  boost::gregorian::date {year, month, 1};
	}

	boost::gregorian::date scheduler::xteenth(short unsigned int weekday) const {
		short unsigned int day = 13;
		while (true) {
			boost::gregorian::date maybe_monteenth {
				this->date.year(),
				this->date.month(),
				day++
			};
			if (maybe_monteenth.day_of_week() == weekday)
				return maybe_monteenth;
		}
	}
	
	boost::gregorian::date scheduler::monteenth() const {
		return this->xteenth(1);
	}

	boost::gregorian::date scheduler::tuesteenth() const {
		return this->xteenth(2);
	}
	
	boost::gregorian::date scheduler::wednesteenth() const {
		return this->xteenth(3);
	}
	
	boost::gregorian::date scheduler::thursteenth() const {
		return this->xteenth(4);
	}
	
	boost::gregorian::date scheduler::friteenth() const {
		return this->xteenth(5);
	}
	
	boost::gregorian::date scheduler::saturteenth() const {
		return this->xteenth(6);
	}
	
	boost::gregorian::date scheduler::sunteenth() const {
		return this->xteenth(0);
	}

	boost::gregorian::date scheduler::first_x(short unsigned int weekday) const {
		short unsigned int day = 1;
		while (true) {
			boost::gregorian::date maybe_first_x {
				this->date.year(),
				this->date.month(),
				day++
			};
			if (maybe_first_x.day_of_week() == weekday)
				return maybe_first_x;
		}
	}

	boost::gregorian::date scheduler::first_monday() const {
		return this->first_x(1);
	}
	
	boost::gregorian::date scheduler::first_tuesday() const {
		return this->first_x(2);
	}
	boost::gregorian::date scheduler::first_wednesday() const {
		return this->first_x(3);
	}
	boost::gregorian::date scheduler::first_thursday() const {
		return this->first_x(4);
	}
	boost::gregorian::date scheduler::first_friday() const {
		return this->first_x(5);		
	}
	boost::gregorian::date scheduler::first_saturday() const {
		return this->first_x(6);
	}
	boost::gregorian::date scheduler::first_sunday() const {
		return this->first_x(0);
	}

	boost::gregorian::date scheduler::second_x(short unsigned int weekday) const {
		boost::gregorian::date first = this->first_x(weekday);
		boost::gregorian::date second {
			first.year(),
			first.month(),
			first.day() + 7u
		};
		return second;
	}
	
	boost::gregorian::date scheduler::second_monday() const {
		return this->second_x(1);
	}
	boost::gregorian::date scheduler::second_tuesday() const {
		return this->second_x(2);
	}
	boost::gregorian::date scheduler::second_wednesday() const {
		return this->second_x(3);
	}
	boost::gregorian::date scheduler::second_thursday() const {
		return this->second_x(4);
	}
	boost::gregorian::date scheduler::second_friday() const {
		return this->second_x(5);
	}
	boost::gregorian::date scheduler::second_saturday() const {
		return this->second_x(6);
	}
	boost::gregorian::date scheduler::second_sunday() const {
		return this->second_x(0);
	}

	boost::gregorian::date scheduler::third_x(short unsigned int weekday) const {
		boost::gregorian::date first = this->first_x(weekday);
		boost::gregorian::date third {
			first.year(),
			first.month(),
			first.day() + 14u
		};
		return third;
	}

	boost::gregorian::date scheduler::third_monday() const {
		return this->third_x(1);
	}
	boost::gregorian::date scheduler::third_tuesday() const {
		return this->third_x(2);
	}
	boost::gregorian::date scheduler::third_wednesday() const {
		return this->third_x(3);
	}
	boost::gregorian::date scheduler::third_thursday() const {
		return this->third_x(4);
	}
	boost::gregorian::date scheduler::third_friday() const {
		return this->third_x(5);
	}
	boost::gregorian::date scheduler::third_saturday() const {
		return this->third_x(6);
	}
	boost::gregorian::date scheduler::third_sunday() const {
		return this->third_x(0);
	}

	boost::gregorian::date scheduler::fourth_x(short unsigned int weekday) const {
		boost::gregorian::date first = this->first_x(weekday);
		boost::gregorian::date fourth {
			first.year(),
			first.month(),
			first.day() + 21u
		};
		return fourth;
	}

	
	boost::gregorian::date scheduler::fourth_monday() const {
		return this->fourth_x(1);
	}
	boost::gregorian::date scheduler::fourth_tuesday() const {
		return this->fourth_x(2);
	}
	boost::gregorian::date scheduler::fourth_wednesday() const {
		return this->fourth_x(3);
	}
	boost::gregorian::date scheduler::fourth_thursday() const {
		return this->fourth_x(4);
	}
	boost::gregorian::date scheduler::fourth_friday() const {
		return this->fourth_x(5);
	}
	boost::gregorian::date scheduler::fourth_saturday() const {
		return this->fourth_x(6);
	}
	boost::gregorian::date scheduler::fourth_sunday() const {
		return this->fourth_x(0);
	}

	boost::gregorian::date scheduler::last_x(short unsigned int weekday) const {
		short unsigned int day = this->date.end_of_month().day();
		while (true) {
			boost::gregorian::date maybe_last {
				this->date.year(),
				this->date.month(),
				day--
			};
			if (maybe_last.day_of_week() == weekday)
				return maybe_last;
		}
	}

	boost::gregorian::date scheduler::last_monday() const {
		return this->last_x(1);
	}
	boost::gregorian::date scheduler::last_tuesday() const {
		return this->last_x(2);
	}
	boost::gregorian::date scheduler::last_wednesday() const {
		return this->last_x(3);
	}
	boost::gregorian::date scheduler::last_thursday() const {
		return this->last_x(4);
	}
	boost::gregorian::date scheduler::last_friday() const {
		return this->last_x(5);
	}
	boost::gregorian::date scheduler::last_saturday() const {
		return this->last_x(6);
	}
	boost::gregorian::date scheduler::last_sunday() const {
		return this->last_x(0);
	}
}
