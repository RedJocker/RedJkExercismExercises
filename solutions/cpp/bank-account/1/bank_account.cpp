#include "bank_account.h"
#include <iostream>
#include <mutex>
#include <stdexcept>
#include <string>

namespace Bankaccount {
	int Bankaccount::id_gen = 0;
	
	Bankaccount::Bankaccount() {
		std::cout << "Bankaccount()" << std::endl;
		this->balance_account = 0;
		this->id = ++Bankaccount::id_gen;
		this->account_open = false;
	}

	Bankaccount::~Bankaccount(){
		std::cout << "~Bankaccount()" << std::endl;
	}
	
	void Bankaccount::open() {
		this->transaction.lock();
		std::cout << "open()" << std::endl;
		if (this->account_open) {
			this->transaction.unlock();	
			throw std::runtime_error("account must be closed to open");
		}
		this->account_open = true;
		this->balance_account = 0;
		this->transaction.unlock();
	}
	
	int Bankaccount::balance(){
		this->transaction.lock();
		std::cout << "balance()" << std::endl;
		if (!this->account_open) {
			this->transaction.unlock();
			throw std::runtime_error("account must be open to get balance");
		}
		int b = this->balance_account;
		this->transaction.unlock();
		return b;
	}

	void Bankaccount::deposit(int ammount) {
		this->transaction.lock();
		std::cout << "deposit(" << std::to_string(ammount) << ")" << std::endl;
		if (!this->account_open) {
			this->transaction.unlock();
			throw std::runtime_error("account must be open to deposit");
		}
		if (ammount <= 0) {
			this->transaction.unlock();
			throw std::runtime_error("invalid deposit ammount");
		}
		this->balance_account += ammount;
		this->transaction.unlock();
	}
	
	void Bankaccount::withdraw(int ammount) {
		this->transaction.lock();
		std::cout << "withdraw(" << std::to_string(ammount) << ")" << std::endl;
		if (!this->account_open) {
			this->transaction.unlock();
			throw std::runtime_error("account must be open to withdraw");
		}
		if (this->balance_account < ammount) {
			this->transaction.unlock();
			throw std::runtime_error("unsuficient funds");
		}
		if (ammount <= 0) {
			this->transaction.unlock();
			throw std::runtime_error("invalid withdraw ammount");
		}
		this->balance_account -= ammount;
		this->transaction.unlock();
	}
	
	void Bankaccount::close() {
		this->transaction.lock();
		std::cout << "close()" << std::endl;
		if (!this->account_open) {
			this->transaction.unlock();
			throw std::runtime_error("account must be open to close");
		}
		this->account_open = false;
		this->transaction.unlock();
	}
}
