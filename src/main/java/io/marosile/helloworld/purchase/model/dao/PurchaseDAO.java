package io.marosile.helloworld.purchase.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class PurchaseDAO {

    @Autowired
    private SqlSessionTemplate session;

    public String generateOrderId() {
        session.insert("purchaseMapper.insertOrderId");
        return session.selectOne("purchaseMapper.selectOrderIdFormatted");
    }
}
