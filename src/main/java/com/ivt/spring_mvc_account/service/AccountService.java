/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ivt.spring_mvc_account.service;

import com.ivt.spring_mvc_account.entity.AccountEntity;
import com.ivt.spring_mvc_account.repository.AccountRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    public List<AccountEntity> getAccounts() {
        List<AccountEntity> accounts
                = (List<AccountEntity>) accountRepository.findAll();
        if (accounts != null && accounts.size() > 0) {
            return accounts;
        }
        return new ArrayList<>();
    }

     public void save(AccountEntity account) {
        accountRepository.save(account);
    }

    public AccountEntity findAccById(long id) {
        Optional<AccountEntity> accOpt = accountRepository.findById(id);
        if (accOpt != null && accOpt.isPresent()) {
            return accOpt.get();
        } else {
            return new AccountEntity();
        }
    }
    
    public void deleteAcc(long id){
        accountRepository.deleteById(id);
    }
}
