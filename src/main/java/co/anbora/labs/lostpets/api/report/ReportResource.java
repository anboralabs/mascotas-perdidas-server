package co.anbora.labs.lostpets.api.report;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/report")
public interface ReportResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    String hello();
}
