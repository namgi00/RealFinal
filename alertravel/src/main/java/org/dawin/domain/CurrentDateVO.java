package org.dawin.domain;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class CurrentDateVO {
	LocalDateTime currentDateTime = LocalDateTime.now(); // currentDateTime은 현재 날짜와 시간
    LocalDate currentDate =  currentDateTime.toLocalDate(); // currentDate는 오늘 날짜(년-월-일)
    LocalTime currentTime = currentDateTime.toLocalTime(); // currentTime은 현재 시간(시:분:초)
    LocalDate resultDay = getTodayDay(currentDate, currentTime); // getTodayDay 메소드를 통해 result 값 확인
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd"); // formatter는 yyyyMMdd의 패턴으로 만듬
    String formattedDay = resultDay.format(formatter); // resultDay의 포맷을 통해 formattedDay

    public static LocalDate getTodayDay(LocalDate date, LocalTime time) {
        // 토요일 또는 일요일이면 무조건 금요일의 날짜 리턴
        if (date.getDayOfWeek() == DayOfWeek.SATURDAY || date.getDayOfWeek() == DayOfWeek.SUNDAY) {
            return date.with(DayOfWeek.FRIDAY);
        }

        // 현재 시간이 오전 11시 이전이면
        if (time.getHour() < 11) {
            // 그 전날의 날짜 리턴
            return date.minusDays(1);
        } else {
            // 현재 날짜의 요일 확인
            DayOfWeek currentDayOfWeek = date.getDayOfWeek();

            // 월요일의 경우 그 전 주 금요일의 날짜 리턴
            if (currentDayOfWeek == DayOfWeek.MONDAY) {
                return date.minusDays(3); // 월요일이라면 3일 전은 금요일
            } else {
                // 오전 11시 이후이면 현재 날짜 리턴
                return date;
            }
        }
    }
}