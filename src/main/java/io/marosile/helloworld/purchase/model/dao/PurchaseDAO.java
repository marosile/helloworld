package io.marosile.helloworld.purchase.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Repository
public class PurchaseDAO {

    @Autowired
    private SqlSessionTemplate session;

    public String generateOrderId(String memberId) {
        session.insert("purchaseMapper.insertOrderId", memberId);
        return session.selectOne("purchaseMapper.selectOrderIdFormatted");
    }

    public int updateOrderFlagToSuccess(String orderId) {
        return session.update("purchaseMapper.updateOrderFlagToSuccess", orderId);
    }

    public int insertOrderLecture(Map<String, Object> map) {
        return session.insert("purchaseMapper.insertOrderLecture", map);
    }
}
