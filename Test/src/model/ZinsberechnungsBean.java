package model;

import java.util.ArrayList;

import database.DBAuslesen;

public class ZinsberechnungsBean {
	
	private double _anfangsKapital;
	private double _zinsSatz;
	private double _laufzeit;
	private double _endKapital;
	
	public double get_endKapital() {
		DBAuslesen db = new DBAuslesen();
		System.out.println("DB Verbindung šffnen: ");
		db.getConnection();
		ArrayList list = new ArrayList();
		list = db.getDatensatz("123456");
		_zinsSatz = Double.parseDouble(list.get(2).toString()); 
		System.out.println(_zinsSatz + "#######");
		_endKapital = (_anfangsKapital * (_zinsSatz/100)) * _laufzeit + _anfangsKapital;
		return _endKapital;
	}
	public void set_anfangsKapital(double _anfangsKapital) {
		this._anfangsKapital = _anfangsKapital;
	}
	public void set_zinsSatz(double _zinsSatz) {
		this._zinsSatz = _zinsSatz;
	}
	public void set_laufzeit(double _laufzeit) {
		this._laufzeit = _laufzeit;
	}
	
	public ZinsberechnungsBean()
	{
	}
	public ZinsberechnungsBean setAnfangskapital(double _anfangsKapital) {
		this._anfangsKapital = _anfangsKapital;
		return this;
	}
	public ZinsberechnungsBean setZinssatz(double _zinsSatz) {
		this._zinsSatz = _zinsSatz;
		return this;
	}
	public ZinsberechnungsBean setLaufzeit(double _laufzeit) {
		this._laufzeit = _laufzeit;
		return this;
	}
}
