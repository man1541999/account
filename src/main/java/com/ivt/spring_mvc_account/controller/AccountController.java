/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ivt.spring_mvc_account.controller;

import com.ivt.spring_mvc_account.entity.AccountEntity;
import com.ivt.spring_mvc_account.enums.Gender;
import com.ivt.spring_mvc_account.service.AccountService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ADMIN
 */
@Controller
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping(value = {"/", "/home"})
    public String viewHome(Model model) {
        model.addAttribute("accounts", accountService.getAccounts());
        return "home";
    }

    String[] countries = new String[]{"VietNam", "USA", "China", "Germany"};

    @RequestMapping("/register")
    public String viewFormRegisterAcc(Model model) {
        model.addAttribute("account", new AccountEntity());
        model.addAttribute("genders", Gender.values());
        model.addAttribute("countries", countries);
        model.addAttribute("action", "add-new");

//        return "account-form";
        return "acc-form-html";
    }

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public String resultRegisterAcc(
            @Valid @ModelAttribute("account") AccountEntity account,
            BindingResult result,
            Model model) {

        if (result.hasErrors()) {
            model.addAttribute("account", account);
            model.addAttribute("genders", Gender.values());
            model.addAttribute("countries", countries);
            if (account.getId() > 0) {
                model.addAttribute("action", "update");
            } else {
                model.addAttribute("action", "add-new");
            }
            return "acc-form-html";
        } else {
            accountService.save(account);
            return "redirect:/home";
        }
    }

    @RequestMapping("/update/{id}")
    public String resultUpdateAcc(
            @PathVariable("id") long id, Model model) {

        AccountEntity account = accountService.findAccById(id);
        model.addAttribute("account", account);
        model.addAttribute("genders", Gender.values());
        model.addAttribute("countries", countries);
        if (account.getId() > 0) {
            model.addAttribute("action", "update");
        } else {
            model.addAttribute("action", "add-new");
        }

//        return "account-form";
        return "acc-form-html";
    }
    
    
     @RequestMapping("/delete/{id}")
    public String deleteAcc(@PathVariable("id") long id, Model model) {
        accountService.deleteAcc(id);
        return "redirect:/home";
    }
}
