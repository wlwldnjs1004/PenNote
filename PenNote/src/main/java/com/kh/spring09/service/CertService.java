package com.kh.spring09.service;




import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.spring09.configuration.CertProperties;
import com.kh.spring09.dao.CertDao;
import com.kh.spring09.dto.CertDto;
import com.kh.spring09.util.RandomGenerator;


	
	@Service
	public class CertService {
		@Autowired
		private JavaMailSender sender;
		@Autowired
		private CertDao certDao;
		@Autowired
		private RandomGenerator randomGenerator;
		@Autowired
		private CertProperties certProperties;
		
		public void sendCertEmail(String email) {
			//인증번호 생성
			String number = randomGenerator.randomNumber(8);
			
			//메세지 생성
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(email);//수신자 설정
			message.setSubject("[KH정보교육원] 인증번호 안내");//제목 설정
			message.setText("인증번호는 ["+number+"] 입니다");//내용 설정
			sender.send(message);//전송
			
			//(+추가) DB등록
			certDao.insertOrUpdate(CertDto.builder()
						.certEmail(email)
						.certNumber(number)
					.build());
		}
		
		
		//정기적으로 인증정보 중 사용할 수 없는 것들을 제거하는 메소드
		
		//@Scheduled(cron = "0 30 9,18 * * *")
		//@Scheduled(cron = "0 30 9,18 * * 1-5")
		//@Scheduled(cron = "0 30 9,18 * * MON-FRI")
		//@Scheduled(cron = "0 0 13 25 * ?")
		//@Scheduled(cron = "0 0 9 ? * WED#1")//매월 첫번째 수요일
		//@Scheduled(cron = "0 0 9 ? * 3L")//매월 마지막 수요일
		
		@Scheduled(cron = "0 0 * * * *")
		public void work() {
			//System.out.println(LocalDateTime.now());
			certDao.clean(
					certProperties.getExpireMinutes(), 
					certProperties.getExpireAccept()
			);
		}
		
	}