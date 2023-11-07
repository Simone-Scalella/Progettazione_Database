# L’uso intelligente dei dati facilita il lavoro
Di seguito saranno riportati tutti gli step di progettazione che hanno portato alla realizzazione di un database per un'azienda.<br />
La seguente descrizione ha lo scopo di fornire una panoramica generale sul lavoro svolto. Per ulteriori dettagli e approfondimenti invitiamo alla lettura della seguente [relazione](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/Relazione_azienda_scang.pdf).<br />
Tutto il codice implementato è presente all'interno di questo [file](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/azienda_scang.sql).<br />
Facendo l'import del file precedente è possibile avere una copia, già popolata, del database che abbiamo realizzato.

## Analisi dei requisiti

### Acquisizione delle informazioni
In questa fase preliminare si vanno a raccogliere i requisiti che dovrà avere il database intervistando i lavoratori che operano all'interno dell'azienda. Ognuno di essi fornisce il suo punto di vista su determinate dinamiche aziendale e descrive i problemi ad esse collegate.
Le sole interviste non sufficienti, infatti, è necessario anche supervisionare, sempre nel rispetto della privacy, alcuni documenti aziendali, come bolle, fatture e buste paga, che permettono di chiarire e comprendere meglio determinate dinamiche e situazioni.
Di seguito riportiamo una rappresentazione grafica dei processi interni all'azienda.
![alt text](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/image/Analisi%20dei%20processi%20interni.png)

### Requisiti espressi nel linguaggio naturale
Successivamente alle interviste e alla ricezione dei documenti, dopo un’attenta analisi delle informazioni in nostro possesso si è stati in grado di identificare il target del progetto. L'obiettivo è realizzare un database che organizzi i dati di un’azienda tessile che si occupa di acquisire merce semilavorata, per poi effettuarci ulteriori lavorazioni fino al raggiungimento del prodotto finito.

### Dizionario dei termini
Questo dizionario serve per rendere più comprensibile alcuni termini che verranno utilizzati all’interno della documentazione.
![alt text](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/image/dizionario%20termini.png)

### Eliminazione delle ambiguit`a presenti
Non sono riscontrabili ambiguità che necessitano di ulteriori spiegazioni.

### Strutturazione dei requisiti
Si dovranno gestire dunque i dati relativi ai fornitori,clienti, dipendenti, commissione del lavoro, e sulla commessa la relativa documentazione,bisogna anche gestire i dati relativi alla contabilità.

## Progettazione Concettuale
In questa fase si è proceduto a descrivere le modalità con cui si intende progedere allo sviluppo del progetto. Nel caso di questo progetto si è proceduto a scegliere un approccio ibrido tra Top-Down e Bottom-Up.

### Identificazione delle entità e delle relazioni fondamentali
In questa fase del progetto si è proceduto all'identificazione delle entità e delle relazioni fondamentali.
Si è individuato:
1. Bilancio mensile
2. Dipendente
3. Commessa
4. Cliente

### Schema dello scheletro
![alt text](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/image/scheletro.png)

### Sviluppo delle componenti dello scheletro
In questa fase si è proceduto a sviluppare le componenti presenti nello schema precedente.

### Schema generale
In rosso sono evidenziati gli attributi che possono essere derivati dagli attributi di altre entità.
![alt text](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/image/Schema%20generale.png)

## Progettazione logica

### Ristrutturazione dello schema concettuale
In questa fase si è proceduto a ristrutturare lo schema concettuale, utilizzando le tavole dei volumi e delle operazioni.
Si vogliono valutare le operazioni previste e capire se certe informazioni derivabili dal nostro schema siano particolarmente interessate in termini di accessi e di costi computazionali e possa risultare utile introdurre altre ridondanze oppure eliminarle, col fine di ridurre tali parametri e migliorare la funzionalità della nostra base di dati.
Successivamente, sono state eliminate le gerarchie e si è proceduto con la fase di accorpamento e partizionamento dei concetti.
Infine, sono stati sostituiti gli attributi composti.

### Schema finale
![alt text](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/image/Schema%20finale.png)

### Traduzione verso il linguaggio relazionale
![alt text](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/image/traduzione.png)

## Codifica SQL e testing
In questa fase, conclusiva del progetto, si è proceduto a implementare fisicamente il database.
Dopo l'implementazione, per verificare l'assenza di bug e altre problematiche, sono stati eseguiti una serie di test.

### Esempio di implementazione del DB in SQL
![alt text](https://github.com/Simone-Scalella/Progettazione_Database/blob/main/image/SQL_example.png)

### Risoluzione di problematiche e miglioramenti.
Alcuni vincoli, richiesti per questo database, non potevano essere implementati con l'istruzione CHECK. E' stato necessario l'utilizzo dei TRIGGER.
```SQL
delimiter $$
create trigger Controllo_data_transtip
after update
on TransStip for each row
begin
if((select DataEsecuzione from UscitaEffettuata
where ID = new.IDTran) < new.DataStip)
then
signal sqlstate ’45000’ set message_text = ’non puoi inserire una data di
pagamento piu’’ piccola di quella dell’’uscita’’.’;
end if;
end $$
delimiter ;
```

Per velocizzare alcune operazioni si è deciso di implementare delle procedure, in questo modo basta inserire i valori degli attributi all’interno della chiamata alla procedura e si ottiene il risultato desiderato. Di seguito ne riportiamo un esempio.

```SQL
delimiter $$
CREATE PROCEDURE insert_stip(Dip varchar(20),data_stip date,Orelavoro decimal(5,2),
OrStraordinario decimal(5,2),GiorniFerie decimal(4,2))
BEGIN
INSERT INTO stipendio (DataStip,Dip,OrLavoro,OrStraordinario,GiorniFerie,importo)
SELECT data_stip,Dip,Orelavoro, OrStraordinario ,GiorniFerie,
Orelavoro*ImpOrRegolare+OrStraordinario*ImpOrStraordinario+GiorniFerie*ImpOrFeriale
FROM Dipendente
WHERE CF = Dip;
END$$
delimiter ;
```

Questo è l'esempio di chiamata:
```SQL
CALL insert_stip(<Dipedente>,<DataStipendio>,<Ore di lavoro regolare>,<Straordinario>,<Giorni
di ferie>);
```
