#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <Arduino_JSON.h>

const char* ssid = "Punggawa";
const char* password = "12345678";

const long interval = 10;
unsigned long previousMillis = 0;

int board = 1;

WiFiClient espClient;

void setup () {
  Serial.begin(115200);
  WiFi.begin(ssid, password); 

  while (WiFi.status() != WL_CONNECTED) {
    Serial.println("Connecting..");
    delay(500);
  }

  if(WiFi.status() == WL_CONNECTED){
    Serial.println("Connected!!!");
  }
  else{
    Serial.println("Connected Failed!!!");
  }
}

void loop() {
    HTTPClient http;
    http.begin(espClient, "http://smarthomenodemcu.000webhostapp.com/proses.php?board="+String(board));
    int httpCode = http.GET();

    unsigned long currentMillis = millis();
  
    if(currentMillis - previousMillis >= interval) {
      if (WiFi.status() == WL_CONNECTED) {
        if (httpCode > 0) {
            String payload = http.getString();
            JSONVar myObject = JSON.parse(payload);
            Serial.print("JSON object = ");
            Serial.println(myObject);
            JSONVar keys = myObject.keys();
        
            for (int i = 0; i < keys.length(); i++) {
                JSONVar value = myObject[keys[i]];
                Serial.print("GPIO: ");
                Serial.print(keys[i]);
                Serial.print(" - SET to: ");
                Serial.println(value);
                pinMode(atoi(keys[i]), OUTPUT);
                digitalWrite(atoi(keys[i]), atoi(value));
            }  
         previousMillis = currentMillis;    
         }
         http.end();
      }
   }  
}
