### **słowny opis jednostek (kontenerów) wchodzących w skład środowiska (można dołączyć do opisu diagram wdrożenia) zawierający m.in.**
Baza danych:
- postgresql
- bazowy obraz: `postgres:12.0-alpine`
- nazwa kontenera: `tictactoe_db`
- nazwy obrazów bazowych,
- w Dockerfile ustawiane są zmienne środowiskowe, pozwalające utworzyć nowego użytkownika i nową bazę danych
- udostępniany jest port 5432 (domyślny dla postgresa)

Backend:
- python - Django
- bazowy obraz: `python:3.9-alpine`
- przekierowanie portów: `-p 8000:8000`
- jest to backend udostępniając api dla gry w kółko i krzyżyk (bez frontendu gry)
- działanie aplikacji można sprawdzić: `http://localhost:8000/api/register/` (rejestracja), `http://localhost:8000/api/token/` (logowanie)
- w Dockerfile m. in. instalowane są biblioteki pythonowe (pip install)
- udostępniany jest port 8000 (domyślny dla Django)


## Zadanie 1 
W celu uruchomienia aplikacji w aplikacji Kubernetes utworzono następujące pliki konfiguracyjne:
![image](https://user-images.githubusercontent.com/50237129/211227903-bd7f47a5-b0a7-4c05-b44c-97fabbdd0736.png)

Następnie, by zaaplikować zmiany do Kubernetesa należy użyć komendy kubectl apply (-f <file>). 

Działający serwis:
![image](https://user-images.githubusercontent.com/50237129/211228136-b9c20106-3fc8-41ad-bdd9-ed840ae2bc1c.png)

![image](https://user-images.githubusercontent.com/50237129/211228204-2be94c16-d782-4a1b-8697-825c9e6a6ea3.png)


