/*
 * JBoss, Home of Professional Open Source
 * Copyright 2007, Red Hat Middleware LLC, and individual contributors
 * as indicated by the @author tags.
 * See the copyright.txt in the distribution for a
 * full listing of individual contributors.
 * This copyrighted material is made available to anyone wishing to use,
 * modify, copy, or redistribute it subject to the terms and conditions
 * of the GNU Lesser General Public License, v. 2.1.
 * This program is distributed in the hope that it will be useful, but WITHOUT A
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
 * You should have received a copy of the GNU Lesser General Public License,
 * v.2.1 along with this distribution; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA  02110-1301, USA.
 *
 * (C) 2005-2006,
 * @author JBoss Inc.
 */
package org.jboss.jbossts.qa.Utils;

import com.arjuna.orbportability.ORB;

import java.util.Properties;

/*
 * Copyright (C) 1998, 1999, 2000, 2001, 2002, 2003
 *
 * Arjuna Technology Ltd.
 * Newcastle upon Tyne,
 * Tyne and Wear,
 * UK.
 *
 * $Id: ORBInterface.java,v 1.3 2003/07/11 12:24:57 jcoleman Exp $
 */

public class ORBInterface
{
	private final static String ORB_NAME = "ats-qa-orb";

	private static ORB _orb = null;

	public static void initORB(String[] params, Properties props)
	{
		_orb = ORB.getInstance(ORB_NAME);
		_orb.initORB(params, props);
	}

	public static ORB getORB()
	{
		return _orb;
	}

	public static org.omg.CORBA.ORB orb()
	{
		return _orb.orb();
	}

	public static void run()
	{
		_orb.orb().run();
	}

	public static void shutdownORB()
	{
		_orb.shutdown();
	}
}
