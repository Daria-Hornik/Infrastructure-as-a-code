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

---
Aplikacja powinna się znajdować w folderze ./full_app/

---

### **Opis uruchamiania aplikacji przy pomocy skryptu powłoki (bez dockercompose),**
1. Wejście do folderu z plikami sh: `/vagrant`
2. Zbudowanie obrazów `sh build-images.sh`
3. Uruchomienie `sh start-containers.sh`

4. Ewentualne zatrzymanie i usunięcie kontenerów: `sh remove-containers.sh`

---


### **Opis uruchamiania aplikacji przy pomocy skryptu docker-compose,**
1. Wejście do folderu z plikami sh: `/vagrant`
2. Uruchomienie `sh start-compose.sh`

3. Ewentualne zatrzymanie i usunięcie kontenerów: `sh remove-containers.sh`

---



### **Konfiguracja**
1. Użycie zmiennych środowiskowych do przekazania parametrów konfiguracyjnych.
Plik `.env` był wcześniej umieszczony w kodzie backendu.\
Dla bazy danych zmienne środowiskowe były dodawane w pliku Dockerfile.

Plik `.env` został przeniesiony na poziom pliku `docker-compose.yml`.\
Zmienne środowiskowe bazy danych i backendu mają wspólną część: 
    - POSTGRES_DB=tictactoedb
    - POSTGRES_USER=tictactoeuser
    - POSTGRES_PASSWORD=tictactoepassword