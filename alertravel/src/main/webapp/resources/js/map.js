var mymap = L.map('map').setView([0, 0], 2);
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
}).addTo(mymap);

var geojsonLayer;
var countryLayer;

// 기본 국가 경계 표시 레이어
countryLayer = L.geoJson.ajax("/resources/geojson/qgis_alarm_lvl.geojson", {
    style: {
        fillColor: '#fff',
        weight: 1,
        opacity: 1,
        color: '#000',
        fillOpacity: 0.7
    },
    onEachFeature: function (feature, layer) {
        var countryName = feature.properties.country_nm;

        var clickableText = L.divIcon({
            className: 'country-label-marker clickable',
            html: countryName,
            iconSize: [100, 40]
        });

        var clickableMarker = L.marker(layer.getBounds().getCenter(), {
            icon: clickableText
        }).addTo(mymap);

        clickableMarker.on('click', function () {
            sendCountryInfoToServer(countryName);
        });
    }
}).addTo(mymap);

// 클릭한 국가 정보를 서버로 전송하는 함수
function sendCountryInfoToServer(countryNm) {
    fetch('/country-info', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ countryNm: countryNm })
    })
    .then(response => {
        window.location.href = '/alarm/get?countryNm=' + countryNm;
    })
    .catch(error => {
        // 오류 처리
    });
}

// 여행경보 레이어 (1단계부터 4단계까지)
geojsonLayer = L.geoJSON.ajax("/resources/geojson/qgis_alarm_lvl.geojson", {
    style: function (feature) {
        var alarmLevel = feature.properties.alarm_lvl;
        var fillColor;

        switch (alarmLevel) {
            case 0:
                fillColor = '#FFFFFF';
                break;
            case 1:
                fillColor = '#2C98CA';
                break;
            case 2:
                fillColor = '#F7B430';
                break;
            case 3:
                fillColor = '#E14C55';
                break;
            case 4:
                fillColor = '#9f9f9f';
                break;
            default:
                fillColor = '#FFFFFF';
        }

        return {
            fillColor: fillColor,
            weight: 1,
            opacity: 1,
            color: '#000',
            fillOpacity: 1
        };
    }
}).addTo(mymap);

// 여행경보 레이어 초기 설정
for (var i = 0; i < alarmLayers.length; i++) {
    mymap.addLayer(alarmLayers[i]);
}

// 여행경보 레이어 변경 함수
function changeAlarmLevel(level) {
    for (var i = 0; i < alarmLayers.length; i++) {
        if (i === level - 1) {
            mymap.addLayer(alarmLayers[i]);
        } else {
            mymap.removeLayer(alarmLayers[i]);
        }
    }
}

mymap.on('zoomend', function () {
    var currentZoom = mymap.getZoom();

    // 줌 레벨에 따라 국가명 표시 여부 조절
    if (currentZoom < 5) {
        mymap.removeLayer(countryLayer);
    } else {
        if (!mymap.hasLayer(countryLayer)) {
            mymap.addLayer(countryLayer);
        }
    }

    // 확대 수준에 따라 여행경보 레이어 처리
    if (currentZoom > 4) {
        mymap.removeLayer(countryLayer);

        countryLayer = L.geoJson.ajax("/resources/geojson/qgis_alarm_lvl.geojson", {
            style: {
                fillColor: '#fff',
                weight: 1,
                opacity: 1,
                color: '#000',
                fillOpacity: 1
            },
            onEachFeature: function (feature, layer) {
                var countryNm = feature.properties.country_nm;

                layer.on('click', function () {
                    window.location.href = '/country/map';
                });
            }
        }).addTo(mymap);
    } else {
        mymap.eachLayer(function (layer) {
            if (layer instanceof L.Marker) {
                mymap.removeLayer(layer);
            }
        });
    }

    // 여행경보 레이어 다시 추가
    changeAlarmLevel(1); // 현재 선택된 레벨로 다시 추가
});