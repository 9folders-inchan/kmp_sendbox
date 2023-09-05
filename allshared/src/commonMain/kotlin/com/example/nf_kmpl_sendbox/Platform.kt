package com.example.nf_kmpl_sendbox

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform