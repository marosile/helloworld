package io.marosile.helloworld.purchase.controller;

import io.marosile.helloworld.purchase.model.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {

    @Autowired
    private PurchaseService service;

    @GetMapping("/success")
    public String purchaseSuccess(String paymentKey,
                                  String orderId,
                                  int amount,
                                  String path,
                                  RedirectAttributes ra) throws IOException, InterruptedException {
        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create("https://api.tosspayments.com/v1/payments/confirm"))
        .header("Authorization", "Basic dGVzdF9za195WnFta0tlUDhnUHBLeXpqd09ZM2JRUnhCOWxHOg==")
        .header("Content-Type", "application/json")
        .method("POST", HttpRequest.BodyPublishers.ofString("{\"paymentKey\":\"" + paymentKey + "\",\"amount\":" + amount + ",\"orderId\":\"" + orderId + "\"}"))
        .build();
        HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println(response.body());
        ra.addFlashAttribute("head", "상품을 구매해 주셔서 감사합니다!");
        ra.addFlashAttribute("message", "마이페이지 - 내 강의에서 확인하실 수 있습니다.");
        return "redirect:" + path;
    }

    @GetMapping("/fail")
    public String purchaseFail(String path) {
        return "redirect:" + path;
    }

    @PostMapping("/generateOrderId")
    @ResponseBody
    public String generateOrderId() {
        return service.generateOrderId();
    }

}
