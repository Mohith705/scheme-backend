"use server";

import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

// Function to set CORS headers
function setCORSHeaders(response) {
    // Allow specific origins or use '*' to allow all
    response.headers.set('Access-Control-Allow-Origin', '*');
    response.headers.set('Access-Control-Allow-Methods', 'GET, OPTIONS');
    response.headers.set('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    response.headers.set('Access-Control-Allow-Credentials', 'true');
    return response;
}

export async function GET(request) {
    const prisma = new PrismaClient();

    try {
        const schemtypes = await prisma.oRIGIN_SCHEMETYPE.findMany({});
        let response = NextResponse.json(schemtypes);
        return setCORSHeaders(response);
    } catch (error) {
        console.error(error);
        let response = NextResponse.error(error);
        return setCORSHeaders(response);
    } finally {
        await prisma.$disconnect();
    }
}

// Handling OPTIONS request for CORS pre-flight
export async function middleware(request) {
    if (request.method === 'OPTIONS') {
        let response = new NextResponse(null, { status: 204 });
        return setCORSHeaders(response);
    }
    return NextResponse.next();
}
