package io.marosile.helloworld.purchase.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {

    @GetMapping("/success")
    public String purchaseSuccess() {
        return null;
    }

    @GetMapping("/fail")
    public String purchaseFail() {
        return null;
    }

}
