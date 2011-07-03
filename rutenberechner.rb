# --------------------------------------------------------------------------
# HAW - "Media Systems"
# PRG
# Hausaufgabe 3 - "Berechnung der Entfernung (Rutenberechner)"
# Loesung von Deniz Kinay
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# 1. Die Definition der Ruten:
@zuDefinierendeRuten = "A-B:5 ,B-C:4 ,C-D:8 ,D-E:6 ,A-D:5 ,C-E:2 ,E-B:3 ,A-E:7".split(',')	# Hier werden die Routen definiert und in einem Array gespeichert.
																							# Diese können nach Belieben verändert werden.
																							# Hier als Beispiel habe ich zur einfacheren Kontrolle die Werte aus dem Mockup bei Github übernommen.
																							# Man haette natürlich auch erst alle moeglichen Ruten ueber die Konsole abfragen und speichern koennen.
																							# Aber da diese sowieso immer nur fuer den jeweiligen Durchlauf vorhanden bleiben, ist dies die einfachere Variante.
@zuFuellendeRute = {}	# Hier wird ein leeres "Array" erzeugt, welches nacher mit der zu errechnenden Rute gefuellt wird.
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# 2. Das Hauptprogramm:
	0.upto (@zuDefinierendeRuten.length - 1) do |i|	# Eine Schleife durchlaeuft das Array "zuDefinierendeRuten".
		temp = @zuDefinierendeRuten[i].split(':')	# Die Strecke und die Laenge wird aufgeteilt und in temp gespeichert.
		@zuFuellendeRute[temp [0] ] = temp[1]		# Das zuvor leere Array wird nun mit Werten gefüllt.
	end

	def berechneDieRute(rute)	# Die Methode "berechneDieRute" wird erstellt und im folgenden definiert.
	  summe = 0
	  rute = rute.split('-')	# Die einzelnen Knoten werden im Array "rute" gespeichert.
	  
	  0.upto (rute.length - 2) do |i|
		temp = @zuFuellendeRute[rute[i] + '-' + rute[i + 1]].to_i	# Hier wird ueberprueft, ob eine abgefragte Strecke existiert.
		
		if (temp == 0)
			temp = @zuFuellendeRute[rute[i + 1] + '-' + rute[i]].to_i	# Das gleiche wird auch umgekehrt ueberprueft (Buchstaben vertauscht).
				
			if (temp == 0)
				return "No Such Route!"	# Existiert die Rute nicht, wird die gewuenschte Fehlermeldung ausgegeben.
			end
		end
		
		summe = summe + temp	# Die Werte, die sich in "temp" befinden, werden zur "Summe" hinzuaddiert.

	end
	  
		return summe	# Zum Schluss wird die summe zurueckgegeben, bzw. mit der Methode ausgegeben.
	
end
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# 3. Die Ruten, die berechnet und ausgegeben werden sollen:
puts berechneDieRute("A-B-C")
puts berechneDieRute("A-D")
puts berechneDieRute("A-D-C")
puts berechneDieRute("A-E-B-C-D")
puts berechneDieRute("X-A-B")

# Die Ruten, die ausgegeben werden sollen, koennen hier eingegeben und veraendert werden.
# Wieder zur einfacheren Kontrolle habe ich die Werte aus dem Mockup bei GitHub verwendet.
# Das Programm kann ueber die Konsole ausgefuehrt werden.
# --------------------------------------------------------------------------