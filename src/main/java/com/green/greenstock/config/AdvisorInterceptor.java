package com.green.greenstock.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.green.greenstock.repository.entity.SubscribeToAdvisorEntity;
import com.green.greenstock.repository.interfaces.SubscribeToAdvisorEntityRepository;
import com.green.greenstock.repository.model.User;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class AdvisorInterceptor implements HandlerInterceptor{

    private final SubscribeToAdvisorEntityRepository subscribeToAdvisorEntityRepository;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("principal");

        //request.getParameter("null");

        SubscribeToAdvisorEntity subscribeToAdvisorEntity = subscribeToAdvisorEntityRepository.findById(user.getId()).orElse(null);
        if(subscribeToAdvisorEntity == null){
            // TODO 
        }
        



        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
}
