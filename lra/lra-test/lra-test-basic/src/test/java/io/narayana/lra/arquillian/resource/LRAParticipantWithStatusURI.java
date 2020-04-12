/*
 * JBoss, Home of Professional Open Source.
 * Copyright 2020, Red Hat, Inc., and individual contributors
 * as indicated by the @author tags. See the copyright.txt file in the
 * distribution for a full listing of individual contributors.
 *
 * This is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software; if not, write to the Free
 * Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA, or see the FSF site: http://www.fsf.org.
 */

package io.narayana.lra.arquillian.resource;

import org.eclipse.microprofile.lra.annotation.Compensate;
import org.eclipse.microprofile.lra.annotation.Complete;
import org.eclipse.microprofile.lra.annotation.Forget;
import org.eclipse.microprofile.lra.annotation.ParticipantStatus;
import org.eclipse.microprofile.lra.annotation.Status;
import org.eclipse.microprofile.lra.annotation.ws.rs.LRA;

import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.NotFoundException;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.net.URI;
import java.util.concurrent.atomic.AtomicInteger;

import static org.eclipse.microprofile.lra.annotation.ws.rs.LRA.LRA_HTTP_CONTEXT_HEADER;
import static org.eclipse.microprofile.lra.annotation.ws.rs.LRA.LRA_HTTP_RECOVERY_HEADER;

@ApplicationScoped
@Path(LRAParticipantWithStatusURI.LRA_PARTICIPANT_PATH)
public class LRAParticipantWithStatusURI {
    public static final String LRA_PARTICIPANT_PATH = "participant-with-status-reporting";
    public static final String TRANSACTIONAL_CLOSE_PATH = "close-work";
    public static final String TRANSACTIONAL_CANCEL_PATH = "cancel-work";
    public static final String FORGET_COUNT_PATH = "forget-count";

    private static final AtomicInteger forgetCount = new AtomicInteger(0);
    private static final AtomicInteger compensateCount = new AtomicInteger(0);
    private static final AtomicInteger completeCount = new AtomicInteger(0);

    @GET
    @Path(TRANSACTIONAL_CLOSE_PATH)
    @LRA
    public Response closeLRA(@HeaderParam(LRA_HTTP_CONTEXT_HEADER) URI lraId) {
        return Response.ok(lraId.toASCIIString()).build();
    }

    @GET
    @Path(TRANSACTIONAL_CANCEL_PATH)
    @LRA(cancelOn = Response.Status.INTERNAL_SERVER_ERROR)
    public Response abortLRA(@HeaderParam(LRA_HTTP_CONTEXT_HEADER) URI lraId) {
        return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(lraId.toASCIIString()).build();
    }

    @GET
    @Path(FORGET_COUNT_PATH)
    public int getForgetCount() {
        return forgetCount.get();
    }

    @PUT
    @Path("compensate")
    @Produces(MediaType.TEXT_PLAIN)
    @Compensate
    public Response compensateWork(@HeaderParam(LRA_HTTP_CONTEXT_HEADER) URI lraId)
            throws NotFoundException {
        compensateCount.incrementAndGet();

        return Response.status(500).entity(ParticipantStatus.FailedToCompensate.name()).build();
    }

    @PUT
    @Path("complete")
    @Produces(MediaType.TEXT_PLAIN)
    @Complete
    public Response completeWork(@HeaderParam(LRA_HTTP_CONTEXT_HEADER) URI lraId)
            throws NotFoundException {
        completeCount.incrementAndGet();

        return Response.status(500).entity(ParticipantStatus.FailedToComplete.name()).build();
    }

    @DELETE
    @Path("delete")
    @Forget
    public Response forget() {
        forgetCount.incrementAndGet();

        return Response.ok().build();
    }

    @GET
    @Path("/status")
    @Produces(MediaType.APPLICATION_JSON)
    @Status
    public Response status(@HeaderParam(LRA_HTTP_CONTEXT_HEADER) URI lraId,
                           @HeaderParam(LRA_HTTP_RECOVERY_HEADER) URI recoveryId) {
        if (completeCount.get() == 1) {
            return Response.ok(ParticipantStatus.FailedToComplete.name()).build();
        } else if (compensateCount.get() == 1) {
            return Response.ok(ParticipantStatus.FailedToCompensate.name()).build();
        } else {
            return Response.ok(ParticipantStatus.Active.name()).build();
        }
    }
}
