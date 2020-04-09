package co.anbora.labs.lostpets.api.pets;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/pets")
public interface PetResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    String hello();
}
