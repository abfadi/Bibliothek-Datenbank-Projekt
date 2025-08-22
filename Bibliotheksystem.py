import tkinter as tk
from tkinter import messagebox
import pyodbc

# Verbindung zur SQL Server-Datenbank
def get_connection():
    return pyodbc.connect(
        "Driver={ODBC Driver 17 for SQL Server};"
        "Server=localhost\MSSQLSERVER01;"   # z. B. localhost\SQLEXPRESS
        "Database=Bibliothek;"
        "Trusted_Connection=yes;"   # oder UID=...;PWD=...
    )

# Buch hinzufügen
def add_book():
    titel = entry_titel.get()
    autor = entry_autor.get()
    jahr = entry_jahr.get()
    genre = entry_genre.get()

    if not titel or not autor:
        messagebox.showerror("Fehler", "Titel und Autor sind Pflichtfelder")
        return

    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC NeuesBuch ?, ?, ?, ?", titel, autor, jahr, genre)
    conn.commit()
    conn.close()
    messagebox.showinfo("Erfolg", "Buch erfolgreich hinzugefügt")

# Mitglied hinzufügen
def add_member():
    name = entry_name.get()
    adresse = entry_adresse.get()
    telefon = entry_telefon.get()
    email = entry_email.get()

    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC NeuesMitglied ?, ?, ?, ?", name, adresse, telefon, email)
    conn.commit()
    conn.close()
    messagebox.showinfo("Erfolg", "Mitglied erfolgreich hinzugefügt")

# GUI erstellen
root = tk.Tk()
root.title("Bibliotheksverwaltung")

# Frame für Buch hinzufügen
frame_book = tk.LabelFrame(root, text="Neues Buch")
frame_book.pack(fill="x", padx=10, pady=5)

tk.Label(frame_book, text="Titel").grid(row=0, column=0)
entry_titel = tk.Entry(frame_book); entry_titel.grid(row=0, column=1)

tk.Label(frame_book, text="Autor").grid(row=1, column=0)
entry_autor = tk.Entry(frame_book); entry_autor.grid(row=1, column=1)

tk.Label(frame_book, text="Erscheinungsjahr (YYYY-MM-DD)").grid(row=2, column=0)
entry_jahr = tk.Entry(frame_book); entry_jahr.grid(row=2, column=1)

tk.Label(frame_book, text="Genre").grid(row=3, column=0)
entry_genre = tk.Entry(frame_book); entry_genre.grid(row=3, column=1)

tk.Button(frame_book, text="Buch hinzufügen", command=add_book).grid(row=4, columnspan=2, pady=5)

# Frame für Mitglied hinzufügen
frame_member = tk.LabelFrame(root, text="Neues Mitglied")
frame_member.pack(fill="x", padx=10, pady=5)

tk.Label(frame_member, text="Name").grid(row=0, column=0)
entry_name = tk.Entry(frame_member); entry_name.grid(row=0, column=1)

tk.Label(frame_member, text="Adresse").grid(row=1, column=0)
entry_adresse = tk.Entry(frame_member); entry_adresse.grid(row=1, column=1)

tk.Label(frame_member, text="Telefon").grid(row=2, column=0)
entry_telefon = tk.Entry(frame_member); entry_telefon.grid(row=2, column=1)

tk.Label(frame_member, text="E-Mail").grid(row=3, column=0)
entry_email = tk.Entry(frame_member); entry_email.grid(row=3, column=1)

tk.Button(frame_member, text="Mitglied hinzufügen", command=add_member).grid(row=4, columnspan=2, pady=5)

root.mainloop()
