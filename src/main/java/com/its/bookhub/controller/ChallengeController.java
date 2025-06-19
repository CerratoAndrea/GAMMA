package com.its.bookhub.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.its.bookhub.model.Book;
import com.its.bookhub.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ChallengeController {

	@GetMapping("/challenge")
    public String challenge(ModelMap model){
		return "listaChallenge";
	}
	
    @GetMapping("/createChallenge")
    public String createChallenge(ModelMap model){
    	
    	Book b1 = new Book();
        b1.setAuthor("George Orwell");
        b1.setImage("1984.jpg");
        b1.setTitle("1984");
        b1.setId(1);
        b1.setSummary("Ultima settimana del novembre 1327. Il novizio Adso da Melk accompagna in un'abbazia dell'alta Italia frate Guglielmo da Baskerville, incaricato di una sottile e imprecisa missione diplomatica. Ex inquisitore, amico di Guglielmo di Occam e di Marsilio da Padova, frate Guglielmo si trova a dover dipanare una serie di misteriosi delitti (sette in sette giorni, perpetrati nel chiuso della cinta abbaziale) che insanguinano una biblioteca labirintica e inaccessibile. Per risolvere il caso, Guglielmo dovrà decifrare indizi di ogni genere, dal comportamento dei santi a quello degli eretici, dalle scritture negromantiche al linguaggio delle erbe, da manoscritti in lingue ignote alle mosse diplomatiche degli uomini di potere. La soluzione arriverà, forse troppo tardi, in termini di giorni, forse troppo presto, in termini di secoli. La copertina dell'articolo può variare.");
        b1.setPages(345);
        b1.setYear("1983");
        b1.setRead(true);
        
        Book b2 = new Book();
        b2.setAuthor("Dante Alighieri");
        b2.setImage("divina_commedia.jpg");
        b2.setTitle("La divina commedia");
        b2.setId(2);
        b2.setSummary("L’opera è divisa in tre parti: Inferno, Purgatorio e Paradiso, ciascuna composta di trentatré canti. Ad accompagnare Dante nella straordinaria discesa all’Inferno e nella salita al Purgatorio è il poeta latino Virgilio, che riveste il ruolo di guida spirituale. I personaggi che i due incontrano nei gironi infernali, dannati dalle colpe sempre più gravi, appartengono non solo alla storia e alla mitologia, ma sono anche contemporanei dell’autore, che non esita a condannare i mali del tempo, e in particolare la corruzione di clero e papato. Per questo motivo La Divina Commedia è considerata anche un’opera politica. Nel Purgatorio, rappresentato come una montagna, si trovano invece coloro che nel corso della vita compirono peccati più lievi; per questo l’atmosfera è più serena, intrisa di speranza, e anche l’anima di Dante, nel corso della salita, si alleggerisce del peso delle sue colpe. Nel Paradiso Dante incontra l’amata Beatrice, che lo conduce attraverso i cieli dei pianeti e delle stelle fisse, tra angeli, santi e beati, fino al cospetto di Dio, in un crescendo di luminosità e di purificazione.");
        b2.setPages(1230);
        b2.setYear("1321");
        b2.setRead(false);
        
        Book b3 = new Book();
        b3.setAuthor("Umberto Eco");
        b3.setImage("il_nome_della_rosa.jpg");
        b3.setTitle("Il nome della rosa");
        b3.setId(3);
        b3.setSummary("Ultima settimana del novembre 1327. Il novizio Adso da Melk accompagna in un'abbazia dell'alta Italia frate Guglielmo da Baskerville, incaricato di una sottile e imprecisa missione diplomatica. Ex inquisitore, amico di Guglielmo di Occam e di Marsilio da Padova, frate Guglielmo si trova a dover dipanare una serie di misteriosi delitti (sette in sette giorni, perpetrati nel chiuso della cinta abbaziale) che insanguinano una biblioteca labirintica e inaccessibile. Per risolvere il caso, Guglielmo dovrà decifrare indizi di ogni genere, dal comportamento dei santi a quello degli eretici, dalle scritture negromantiche al linguaggio delle erbe, da manoscritti in lingue ignote alle mosse diplomatiche degli uomini di potere. La soluzione arriverà, forse troppo tardi, in termini di giorni, forse troppo presto, in termini di secoli. La copertina dell'articolo può variare.");
        b3.setPages(345);
        b3.setYear("1983");
        b3.setRead(null);
        
        Book b4 = new Book();
        b4.setAuthor("Francis Scott Fitzgerald");
        b4.setImage("The_Great_Gatsby.jpg");
        b4.setTitle("Il grande Gatsby");
        b4.setId(4);
        b4.setSummary("Ultima settimana del novembre 1327. Il novizio Adso da Melk accompagna in un'abbazia dell'alta Italia frate Guglielmo da Baskerville, incaricato di una sottile e imprecisa missione diplomatica. Ex inquisitore, amico di Guglielmo di Occam e di Marsilio da Padova, frate Guglielmo si trova a dover dipanare una serie di misteriosi delitti (sette in sette giorni, perpetrati nel chiuso della cinta abbaziale) che insanguinano una biblioteca labirintica e inaccessibile. Per risolvere il caso, Guglielmo dovrà decifrare indizi di ogni genere, dal comportamento dei santi a quello degli eretici, dalle scritture negromantiche al linguaggio delle erbe, da manoscritti in lingue ignote alle mosse diplomatiche degli uomini di potere. La soluzione arriverà, forse troppo tardi, in termini di giorni, forse troppo presto, in termini di secoli. La copertina dell'articolo può variare.");
        b4.setPages(345);
        b4.setYear("1983");
        b4.setRead(null);
        
        Book b5 = new Book();
        b5.setAuthor("Stephen King");
        b5.setImage("carrie.jpg");
        b5.setTitle("Carrie");
        b5.setId(5);
        
        Book b6 = new Book();
        b6.setAuthor("Stephen King");
        b6.setImage("shining.jpg");
        b6.setTitle("Shining");
        b6.setId(6);
        
        Book b7 = new Book();
        b7.setAuthor("Ken Follett");
        b7.setImage("pilastri.jpg");
        b7.setTitle("I Pilastri della Terra");
        b7.setId(7);
        
        Book b8 = new Book();
        b8.setAuthor("Agatha Christie");
        b8.setImage("10_piccoli_indiani.jpg");
        b8.setTitle("Dieci piccoli indiani");
        b8.setId(8);
        
        Book b9 = new Book();
        b9.setAuthor("Roberto Saviano");
        b9.setImage("gomorra.jpg");
        b9.setTitle("Gomorra");
        b9.setId(9);
        
        Book b10 = new Book();
        b10.setAuthor("Jane Austen");
        b10.setImage("orgoglio.jpg");
        b10.setTitle("Orgoglio e Pregiudizio");
        b10.setId(10);
        b10.setRead(false);
        
        Book b11 = new Book();
        b11.setAuthor("George R.R. Martin");
        b11.setImage("il_trono.jpg");
        b11.setTitle("Il Trono di Spade");
        b11.setId(11);
        
        Book b12 = new Book();
        b12.setAuthor("Dan Brown");
        b12.setImage("codice.jpg");
        b12.setTitle("Il codice Da Vinci");
        b12.setId(12);
        
        List<Book> books = new ArrayList<Book>();
        books.add(b1);
        books.add(b2);
        books.add(b3);
        books.add(b4);
        books.add(b5);
        books.add(b6);
        books.add(b7);
        books.add(b8); 
        books.add(b9);
        books.add(b10);
        books.add(b11);
        books.add(b12);
        
        model.put("libBooks", books);
         
        return "createChallenge";
    }
    
    @GetMapping("/visChallenge")
    public String visChallenge(ModelMap model){
    	
    	 Book b1 = new Book();
         b1.setAuthor("George Orwell");
         b1.setImage("1984.jpg");
         b1.setTitle("1984");
         b1.setId(1);
         b1.setSummary("Ultima settimana del novembre 1327. Il novizio Adso da Melk accompagna in un'abbazia dell'alta Italia frate Guglielmo da Baskerville, incaricato di una sottile e imprecisa missione diplomatica. Ex inquisitore, amico di Guglielmo di Occam e di Marsilio da Padova, frate Guglielmo si trova a dover dipanare una serie di misteriosi delitti (sette in sette giorni, perpetrati nel chiuso della cinta abbaziale) che insanguinano una biblioteca labirintica e inaccessibile. Per risolvere il caso, Guglielmo dovrà decifrare indizi di ogni genere, dal comportamento dei santi a quello degli eretici, dalle scritture negromantiche al linguaggio delle erbe, da manoscritti in lingue ignote alle mosse diplomatiche degli uomini di potere. La soluzione arriverà, forse troppo tardi, in termini di giorni, forse troppo presto, in termini di secoli. La copertina dell'articolo può variare.");
         b1.setPages(345);
         b1.setYear("1983");
         b1.setRead(true);
         
         Book b2 = new Book();
         b2.setAuthor("Dante Alighieri");
         b2.setImage("divina_commedia.jpg");
         b2.setTitle("La divina commedia");
         b2.setId(2);
         b2.setSummary("Ultima settimana del novembre 1327. Il novizio Adso da Melk accompagna in un'abbazia dell'alta Italia frate Guglielmo da Baskerville, incaricato di una sottile e imprecisa missione diplomatica. Ex inquisitore, amico di Guglielmo di Occam e di Marsilio da Padova, frate Guglielmo si trova a dover dipanare una serie di misteriosi delitti (sette in sette giorni, perpetrati nel chiuso della cinta abbaziale) che insanguinano una biblioteca labirintica e inaccessibile. Per risolvere il caso, Guglielmo dovrà decifrare indizi di ogni genere, dal comportamento dei santi a quello degli eretici, dalle scritture negromantiche al linguaggio delle erbe, da manoscritti in lingue ignote alle mosse diplomatiche degli uomini di potere. La soluzione arriverà, forse troppo tardi, in termini di giorni, forse troppo presto, in termini di secoli. La copertina dell'articolo può variare.");
         b2.setPages(345);
         b2.setYear("1983");
         b2.setRead(false);
         
         Book b3 = new Book();
         b3.setAuthor("Umberto Eco");
         b3.setImage("il_nome_della_rosa.jpg");
         b3.setTitle("Il nome della rosa");
         b3.setId(3);
         b3.setSummary("Ultima settimana del novembre 1327. Il novizio Adso da Melk accompagna in un'abbazia dell'alta Italia frate Guglielmo da Baskerville, incaricato di una sottile e imprecisa missione diplomatica. Ex inquisitore, amico di Guglielmo di Occam e di Marsilio da Padova, frate Guglielmo si trova a dover dipanare una serie di misteriosi delitti (sette in sette giorni, perpetrati nel chiuso della cinta abbaziale) che insanguinano una biblioteca labirintica e inaccessibile. Per risolvere il caso, Guglielmo dovrà decifrare indizi di ogni genere, dal comportamento dei santi a quello degli eretici, dalle scritture negromantiche al linguaggio delle erbe, da manoscritti in lingue ignote alle mosse diplomatiche degli uomini di potere. La soluzione arriverà, forse troppo tardi, in termini di giorni, forse troppo presto, in termini di secoli. La copertina dell'articolo può variare.");
         b3.setPages(345);
         b3.setYear("1983");
         b3.setRead(null);
         
         Book b4 = new Book();
         b4.setAuthor("Francis Scott Fitzgerald");
         b4.setImage("The_Great_Gatsby.jpg");
         b4.setTitle("Il grande Gatsby");
         b4.setId(4);
         b4.setSummary("Ultima settimana del novembre 1327. Il novizio Adso da Melk accompagna in un'abbazia dell'alta Italia frate Guglielmo da Baskerville, incaricato di una sottile e imprecisa missione diplomatica. Ex inquisitore, amico di Guglielmo di Occam e di Marsilio da Padova, frate Guglielmo si trova a dover dipanare una serie di misteriosi delitti (sette in sette giorni, perpetrati nel chiuso della cinta abbaziale) che insanguinano una biblioteca labirintica e inaccessibile. Per risolvere il caso, Guglielmo dovrà decifrare indizi di ogni genere, dal comportamento dei santi a quello degli eretici, dalle scritture negromantiche al linguaggio delle erbe, da manoscritti in lingue ignote alle mosse diplomatiche degli uomini di potere. La soluzione arriverà, forse troppo tardi, in termini di giorni, forse troppo presto, in termini di secoli. La copertina dell'articolo può variare.");
         b4.setPages(345);
         b4.setYear("1983");
         b4.setRead(null);
         
         Book b5 = new Book();
         b5.setAuthor("Stephen King");
         b5.setImage("carrie.jpg");
         b5.setTitle("Carrie");
         b5.setId(5);
         
         Book b6 = new Book();
         b6.setAuthor("Stephen King");
         b6.setImage("shining.jpg");
         b6.setTitle("Shining");
         b6.setId(6);
         
         Book b8 = new Book();
         b8.setAuthor("Agatha Christie");
         b8.setImage("10_piccoli_indiani.jpg");
         b8.setTitle("Dieci piccoli indiani");
         b8.setId(8);
         
         List<Book> books = new ArrayList<Book>();
         books.add(b1);
         //books.add(b2);
         books.add(b3);
         books.add(b4);
         books.add(b8);
         books.add(b6);
         
         model.put("libBooks", books);
         
        return "visChallenge";
    }

}
