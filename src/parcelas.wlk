import plantas.*
class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	var property colPlantas = []
	
	method superficie() = self.ancho()*self.largo()
	method cantMaxima() = if(self.ancho()>self.largo()) {self.superficie()/5} else {self.superficie()/3 + self.largo()} 
	method tieneComplicaciones() = colPlantas.any({p =>p.horasSol()<self.horasDeSol()})
	method cantActual() = colPlantas.size()
	method plantarPlanta(unaPlanta){
		if(self.cantActual()+1>self.cantMaxima() or unaPlanta.horasSol()+2 <=self.horasDeSol())
		{self.error("Error no se puede plantar")}
		else {colPlantas.add(unaPlanta)}
	}
	method plantaBienAsociada(unaPlanta)	
}

class Ecologica inherits Parcela{
	override method plantaBienAsociada(unaPlanta)= not self.tieneComplicaciones() and unaPlanta.parcelaIdeal(self)
}

class Industrial inherits Parcela{
	override method plantaBienAsociada(unaPlanta) = self.cantMaxima()==2 and unaPlanta.esFuerte()
}



