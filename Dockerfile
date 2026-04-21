FROM python:3.11-slim              # Baas-image: Python 3.11 (slim = väiksem, ilma arendusvahenditeta)
WORKDIR /app                       # Töökataloog konteineris (luuakse automaatselt)

COPY requirements.txt .            # Kopeerime esmalt ainult requirements (Docker cache optimeerimine)
RUN pip install --no-cache-dir -r requirements.txt  # --no-cache-dir = väiksem image

COPY app.py .                      # Kopeerime rakenduse koodi

EXPOSE 5000                        # Dokumenteerib et rakendus kuulab port 5000

CMD ["python", "app.py"]          # TAHTLIK VIGA: main.py ei eksisteeri, peab olema app.py
