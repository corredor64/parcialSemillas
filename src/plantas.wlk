class Planta{
	var property asemilla = 0
	var property altura = 0
	method horasSol()
	method esFuerte() = self.horasSol()>10
	method espacio()
	method nuevasSemillas() = self.esFuerte()
}

class Menta inherits Planta{
	override method horasSol() = 6
	override method nuevasSemillas() = super() or self.altura()>0.4	
	
	override method espacio() = self.altura()*3	
}

class Soja inherits Planta{
	override method horasSol(){
		var horas = 0
		if(self.altura()<0.5)
		{horas=6}
		else if(self.altura().between(0.5,1))
		{horas=7}
		else {horas=9}
	return horas
	}
	override method nuevasSemillas() = super() and self.asemilla()>2007 and self.altura()>1
	override method espacio() = self.altura()/2
}

class Quinoa inherits Planta{
	var property horasSol
	override method espacio() = 0.5
	override method nuevasSemillas() = super() or self.asemilla()<2005
	
}

class SojaTrans inherits Soja{
	override method nuevasSemillas() = false	
}

class HierbaBuena inherits Menta{
	override method espacio() = super()*2
}
