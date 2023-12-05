<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<script src="https://unpkg.com/leaflet-ajax/dist/leaflet.ajax.min.js"></script>
<script src="/resources/js/map.js"></script>
<!-- map.js 파일 경로로 수정 -->

<link rel="stylesheet" href="/resources/css/style.css" />

<script>
    $(document).ready(function () {
        const colorsArray = ["#2C98CA", "#F7B430", "#E14C55", "#9f9f9f"];

        // Loop through each path element
        $("path.leaflet-interactive").each(function () {
            let fillValue = $(this).attr("fill");

            // Check if fillValue matches any color in colorsArray
            for (let i = 0; i < colorsArray.length; i++) {
                if (colorsArray[i] == fillValue) {
                    $(this).attr("id", (i + 1).toString()); // Assign id based on index + 1
                    break;
                }
            }
        });

        // Function to toggle fill color based on checkbox state
        function toggleFill1() {
            // Loop through each path element with id="1"
            $("path#1.leaflet-interactive").each(function () {
                // Get the checkbox state
                const isChecked = $("input[value='case1']").prop("checked");

                // Set fill color based on checkbox state
                if (isChecked) {
                    // If checkbox is checked, set fill color to colorsArray[0]
                    $(this).attr("fill", colorsArray[0]);
                } else {
                    // If checkbox is unchecked, set fill color to #fff
                    $(this).attr("fill", "#fff");
                }
            });
        }
        
        function toggleFill2() {
            // Loop through each path element with id="1"
            $("path#2.leaflet-interactive").each(function () {
                // Get the checkbox state
                const isChecked = $("input[value='case2']").prop("checked");

                // Set fill color based on checkbox state
                if (isChecked) {
                    // If checkbox is checked, set fill color to colorsArray[0]
                    $(this).attr("fill", colorsArray[1]);
                } else {
                    // If checkbox is unchecked, set fill color to #fff
                    $(this).attr("fill", "#fff");
                }
            });
        }
        
        function toggleFill3() {
            // Loop through each path element with id="1"
            $("path#3.leaflet-interactive").each(function () {
                // Get the checkbox state
                const isChecked = $("input[value='case3']").prop("checked");

                // Set fill color based on checkbox state
                if (isChecked) {
                    // If checkbox is checked, set fill color to colorsArray[0]
                    $(this).attr("fill", colorsArray[2]);
                } else {
                    // If checkbox is unchecked, set fill color to #fff
                    $(this).attr("fill", "#fff");
                }
            });
        }
        
        function toggleFill4() {
            // Loop through each path element with id="1"
            $("path#4.leaflet-interactive").each(function () {
                // Get the checkbox state
                const isChecked = $("input[value='case4']").prop("checked");

                // Set fill color based on checkbox state
                if (isChecked) {
                    // If checkbox is checked, set fill color to colorsArray[0]
                    $(this).attr("fill", colorsArray[3]);
                } else {
                    // If checkbox is unchecked, set fill color to #fff
                    $(this).attr("fill", "#fff");
                }
            });
        }

        // Attach the toggleFill function to the checkbox click event
        $("input[value='case1']").on("click", toggleFill1);
        $("input[value='case2']").on("click", toggleFill2);
        $("input[value='case3']").on("click", toggleFill3);
        $("input[value='case4']").on("click", toggleFill4);
        
        $('#case1').change(function() {
            // checkbox가 체크된 상태이면
            if ($(this).is(':checked')) {
              // 배경 색을 blue로 변경
              $('.checkbox-label1').css('background-color', 'rgba(0,50,150,0.5)');
              $('.checkbox-label1').css('color', 'white');
            } else {
              // 체크 해제된 경우 배경 색 제거
              $('.checkbox-label1').css('background-color', '#fff');
              $('.checkbox-label1').css('color', 'black');
            }
          });
        
        $('#case2').change(function() {
            // checkbox가 체크된 상태이면
            if ($(this).is(':checked')) {
              // 배경 색을 blue로 변경
              $('.checkbox-label2').css('background-color', 'rgba(0,50,150,0.5)');
              $('.checkbox-label2').css('color', 'white');
            } else {
              // 체크 해제된 경우 배경 색 제거
              $('.checkbox-label2').css('background-color', '#fff');
              $('.checkbox-label2').css('color', 'black');
            }
          });
        
        $('#case3').change(function() {
            // checkbox가 체크된 상태이면
            if ($(this).is(':checked')) {
              // 배경 색을 blue로 변경
              $('.checkbox-label3').css('background-color', 'rgba(0,50,150,0.5)');
              $('.checkbox-label3').css('color', 'white');
            } else {
              // 체크 해제된 경우 배경 색 제거
              $('.checkbox-label3').css('background-color', '#fff');
              $('.checkbox-label3').css('color', 'black');
            }
          });
        
        $('#case4').change(function() {
        	
            // checkbox가 체크된 상태이면
            if ($(this).is(':checked')) {
              // 배경 색을 blue로 변경
              $('.checkbox-label4').css('background-color', 'rgba(0,50,150,0.5)');
              $('.checkbox-label4').css('color', 'white');
            } else {
              // 체크 해제된 경우 배경 색 제거
              $('.checkbox-label4').css('background-color', '#fff');
              $('.checkbox-label4').css('color', 'black');
            }
          });
        
        
    });
</script>
<div id="map"></div>
