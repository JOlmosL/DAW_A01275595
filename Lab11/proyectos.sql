BULK INSERT A1275595.A1275595.[Proyectos]
   FROM 'C:\Users\JESUS\Downloads\proyectos.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )