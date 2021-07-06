/*
 * Copyright Red Hat
 * SPDX-License-Identifier: LGPL-2.1-only
 */

package io.narayana.lra.arquillian;

import io.narayana.lra.arquillian.appender.MpLraTckAuxiliaryArchiveAppender;
import org.jboss.arquillian.container.test.spi.client.deployment.AuxiliaryArchiveAppender;
import org.jboss.arquillian.core.spi.LoadableExtension;

/**
 * This class is the activation point to use {@link MpLraTckAuxiliaryArchiveAppender}.
 */
public class MpLraTckExtension  implements LoadableExtension {

    @Override
    public void register(ExtensionBuilder extensionBuilder) {
        extensionBuilder.service(AuxiliaryArchiveAppender.class, MpLraTckAuxiliaryArchiveAppender.class);
    }
}
