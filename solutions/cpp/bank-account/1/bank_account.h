#if !defined(BANK_ACCOUNT_H)
#define BANK_ACCOUNT_H

#include <mutex> 

namespace Bankaccount {
	class Bankaccount {
	private:
		static int id_gen;
		int	id;
		int balance_account;
		bool account_open;
		std::mutex transaction;
		
	public:
		Bankaccount();
		~Bankaccount();
		void open();
		int balance();
		void deposit(int ammount);
		void withdraw(int ammount);
		void close();
	};

}

#endif
